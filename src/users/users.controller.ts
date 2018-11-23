import {
    Body,
    ClassSerializerInterceptor,
    Controller,
    Delete,
    Get,
    HttpCode,
    NotFoundException,
    Param,
    Post,
    Put,
    UseInterceptors
} from '@nestjs/common';
import {Repository} from 'typeorm';
import {User} from '../database/entities/user.entity';
import {InjectRepository} from '@nestjs/typeorm';
import {Specialty} from '../database/entities/specialty.entity';
import {Team} from '../database/entities/team.entity';

@Controller('users')
@UseInterceptors(ClassSerializerInterceptor)
export class UsersController {
    constructor(@InjectRepository(User) private readonly repository: Repository<User>,
                @InjectRepository(Specialty) private readonly specialtyRepository: Repository<Specialty>,
                @InjectRepository(Team) private readonly teamRepository: Repository<Team>) {
    }

    @Get()
    find() {
        return this.repository.find({relations: ['teamLeaderOf'], loadRelationIds: {relations: ['teamLeaderOf']}});
    }

    @Get(':id')
    get(@Param('id') id) {
        return this.repository.findOne(id, {relations: ['teamLeaderOf'], loadRelationIds: {relations: ['teamLeaderOf']}});
    }

    @Post()
    add(@Body() specialty: Specialty) {
        return this.repository.save(specialty);
    }

    @Put(':id')
    async update(@Param('id') id, @Body() user: User) {
        if (!await this.repository.findOne(id))
            throw new NotFoundException();

        if (user.teamLeaderOf) {
            const team = await this.teamRepository.findOne(user.teamLeaderOf as any);
            if (!team) throw new NotFoundException(`No team with ID=${user.teamLeaderOf} found.`);
            user.teamLeaderOf = team;
        }

        return this.repository.save({id, ...user});
    }

    @Delete(':id')
    async remove(@Param('id') id) {
        const user = await this.repository.findOne(id);

        if (!user) throw new NotFoundException();

        return await this.repository.remove(user);
    }

    @Get(':userId/developers')
    getDevelopers(@Param('userId') userId) {
        return this.repository.createQueryBuilder()
            .relation('developers')
            .of(userId)
            .loadMany();
    }

    @Post(':userId/developers')
    @HttpCode(204)
    addDeveloper(@Param('userId') userId, @Body() developer: User) {
        return this.repository.createQueryBuilder()
            .relation('developers')
            .of(userId)
            .add(developer);
    }

    @Delete(':userId/developers/:id')
    @HttpCode(204)
    async removeDeveloper(@Param('userId') userId, @Param('id') id) {
        if (!await this.repository.findOne(id))
            throw new NotFoundException();

        return await this.repository.createQueryBuilder()
            .relation('developers')
            .of(userId)
            .remove(id);
    }

    @Get(':userId/specialties')
    getSpecialties(@Param('userId') userId) {
        return this.repository.createQueryBuilder()
            .relation('specialties')
            .of(userId)
            .loadMany();
    }

    @Post(':userId/specialties')
    @HttpCode(204)
    addSpecialty(@Param('userId') userId, @Body() specialty: Specialty) {
        return this.repository.createQueryBuilder()
            .relation('specialties')
            .of(userId)
            .add(specialty);
    }

    @Delete(':userId/specialties/:id')
    @HttpCode(204)
    async removeSpecialty(@Param('userId') userId, @Param('id') id) {
        if (!await this.specialtyRepository.findOne(id))
            throw new NotFoundException();

        return await this.repository.createQueryBuilder()
            .relation('specialties')
            .of(userId)
            .remove(id);
    }
}
