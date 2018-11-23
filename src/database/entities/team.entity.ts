import {Column, Entity, JoinColumn, OneToOne, PrimaryGeneratedColumn} from 'typeorm';
import {User} from './user.entity';

@Entity()
export class Team {

    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    name: string;

    @OneToOne(() => User, user => user.teamLeaderOf)
    @JoinColumn()
    teamLeader: User;
}
