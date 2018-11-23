import {Module} from '@nestjs/common';
import {SpecialtiesController} from './specialties.controller';
import {DatabaseModule} from '../database/database.module';

@Module({
    imports: [DatabaseModule],
    controllers: [SpecialtiesController]
})
export class SpecialtiesModule {
}
