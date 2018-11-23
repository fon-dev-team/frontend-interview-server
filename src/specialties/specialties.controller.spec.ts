import { Test, TestingModule } from '@nestjs/testing';
import { SpecialtiesController } from './specialties.controller';

describe('Specialties Controller', () => {
  let module: TestingModule;
  beforeAll(async () => {
    module = await Test.createTestingModule({
      controllers: [SpecialtiesController],
    }).compile();
  });
  it('should be defined', () => {
    const controller: SpecialtiesController = module.get<SpecialtiesController>(SpecialtiesController);
    expect(controller).toBeDefined();
  });
});
