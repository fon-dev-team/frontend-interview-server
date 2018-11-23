import { Test, TestingModule } from '@nestjs/testing';
import { TeamsController } from './teams.controller';

describe('Teams Controller', () => {
  let module: TestingModule;
  beforeAll(async () => {
    module = await Test.createTestingModule({
      controllers: [TeamsController],
    }).compile();
  });
  it('should be defined', () => {
    const controller: TeamsController = module.get<TeamsController>(TeamsController);
    expect(controller).toBeDefined();
  });
});
