import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { TeamsModule } from './teams/teams.module';
import { SpecialtiesModule } from './specialties/specialties.module';
import { DatabaseModule } from './database/database.module';

@Module({
  imports: [
      TypeOrmModule.forRoot(),
      UsersModule,
      TeamsModule,
      SpecialtiesModule,
      DatabaseModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
