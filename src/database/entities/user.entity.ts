import {Column, Entity, JoinTable, ManyToMany, ManyToOne, OneToMany, OneToOne, PrimaryGeneratedColumn} from 'typeorm';
import {UserType} from '../types/user-type';
import {Specialty} from './specialty.entity';
import {Team} from './team.entity';
import {Exclude, Expose, Transform} from 'class-transformer';

@Entity()
export class User {

    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    name: string;

    @Column()
    surname: string;

    @Column('int', {nullable: true})
    age: number;

    @Column()
    email: string;

    @Column({nullable: true})
    avatar: string;

    @OneToMany(() => User, user => user.teamLeader, {nullable: true})
    @Exclude()
    developers: User[];

    @ManyToOne(() => User, user => user.developers, {nullable: true})
    @Exclude()
    teamLeader: User[];

    @OneToOne(() => Team, team => team.teamLeader)
    @Transform((team: Team) => team || undefined)
    teamLeaderOf: Team;

    @ManyToMany(() => Specialty, specialty => specialty.users)
    @JoinTable()
    @Exclude()
    specialties: Specialty[];

    @Expose()
    get type(): UserType {
        return this.teamLeaderOf ? UserType.TeamLeader : UserType.Developer;
    }
}
