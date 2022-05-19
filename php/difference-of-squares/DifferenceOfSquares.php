<?php declare(strict_types=1);

function squareOfSum(int $max): int
{
    return array_sum(range(1, $max)) ** 2;
}

function sumOfSquares(int $max): int
{
    return array_sum(array_map(fn($i) => $i * $i, range(1, $max)));
}

function difference(int $max): int
{
    return squareOfSum($max) - sumOfSquares($max);
}
