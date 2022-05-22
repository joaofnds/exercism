<?php declare(strict_types=1);

function toRna(string $dna): string
{
    return strtr($dna, "GCTA", "CGAU");
}
