import {Column, Entity, ManyToMany, PrimaryGeneratedColumn} from 'typeorm';
import {User} from './user.entity';

@Entity()
export class Specialty {

    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    name: string;

    @ManyToMany(() => User, user => user.specialties)
    users: User[];
}
