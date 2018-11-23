import {Controller, Get, Param} from '@nestjs/common';
import {Repository} from 'typeorm';
import {Team} from '../database/entities/team.entity';
import {InjectRepository} from '@nestjs/typeorm';

@Controller('teams')
export class TeamsController {
    constructor(@InjectRepository(Team) private readonly repository: Repository<Team>) {
    }

    @Get()
    find() {
        return this.repository.find();
    }

    @Get(':id')
    get(@Param('id') id) {
        return this.repository.findOne(id);
    }
}
