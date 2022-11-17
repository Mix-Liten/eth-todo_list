// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    event TaskCreated(uint256 id, string content, bool completed);

    event TaskComplete(uint256 id, bool completed);

    mapping(uint256 => Task) public tasks;

    constructor() {
        createTask("Hello World!");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint256 _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskComplete(_id, _task.completed);
    }
}
