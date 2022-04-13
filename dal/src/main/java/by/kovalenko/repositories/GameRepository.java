package by.kovalenko.repositories;

import by.kovalenko.entity.GameEntity;
import by.kovalenko.entity.UserEntity;
import by.kovalenko.util.GameStatusName;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

public interface GameRepository extends JpaRepository<GameEntity, UUID> {

    List<GameEntity> findAllByCreatorUsername(String username);

    HashSet<GameEntity> findAllByUsersUsername(String username);

    List<GameEntity> findAllByGameStatusGameStatusNameAndCreatorUsernameIsNotAndUsersIsNotContaining(GameStatusName gameStatusName, String username, UserEntity userEntity);

    List<GameEntity> findAllByGameStatusGameStatusNameAndGameStatusDateBefore(GameStatusName gameStatusName, LocalDateTime createdDateTime);
}
