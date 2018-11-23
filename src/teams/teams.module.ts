import {Module} from '@nestjs/common';
import {TeamsController} from './teams.controller';
import {DatabaseModule} from '../database/database.module';

@Module({
    imports: [DatabaseModule],
    controllers: [TeamsController]
})
export class TeamsModule {
}
