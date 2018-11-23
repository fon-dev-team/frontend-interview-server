import {Body, Controller, Delete, Get, NotFoundException, Param, Post, Put} from '@nestjs/common';
import {Repository} from 'typeorm';
import {Specialty} from '../database/entities/specialty.entity';
import {InjectRepository} from '@nestjs/typeorm';

@Controller('specialties')
export class SpecialtiesController {
    constructor(@InjectRepository(Specialty) private readonly repository: Repository<Specialty>) {
    }

    @Get()
    find() {
        return this.repository.find();
    }

    @Get(':id')
    get(@Param('id') id) {
        return this.repository.findOne(id);
    }

    @Post()
    add(@Body() specialty: Specialty) {
        return this.repository.save(specialty);
    }

    @Put(':id')
    async update(@Param('id') id, @Body() specialty: Specialty) {
        if (!await this.repository.findOne(id))
            throw new NotFoundException();

        return this.repository.save({id, ...specialty});
    }

    @Delete(':id')
    async remove(@Param('id') id) {
        const specialty = await this.repository.findOne(id);

        if (!specialty) throw new NotFoundException();

        return await this.repository.remove(specialty);
    }
}
