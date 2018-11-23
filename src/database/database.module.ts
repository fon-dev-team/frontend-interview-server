import {Module} from '@nestjs/common';
import {TypeOrmModule} from '@nestjs/typeorm';
import {User} from './entities/user.entity';
import {Team} from './entities/team.entity';
import {Specialty} from './entities/specialty.entity';

@Module({
    imports: [
        TypeOrmModule.forFeature([User, Team, Specialty])
    ]
})
export class DatabaseModule {
}
