<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * Password checks
 *
 * PHP version 5
 *
 * Copyright © 2017 The Galette Team
 *
 * This file is part of Galette (http://galette.tuxfamily.org).
 *
 * Galette is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Galette is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Galette. If not, see <http://www.gnu.org/licenses/>.
 *
 * @category  Util
 * @package   Galette
 *
 * @author    Johan Cwiklinski <johan@x-tnd.be>
 * @copyright 2017 The Galette Team
 * @license   http://www.gnu.org/licenses/gpl-3.0.html GPL License 3.0 or (at your option) any later version
 * @link      http://galette.tuxfamily.org
 * @since     Available since 0.9
 */

namespace Galette\Util;

use Analog\Analog;
use Galette\Core\Preferences;
use Symfony\Component\Validator\Validation;
use Rollerworks\Component\PasswordStrength\Validator\Constraints\PasswordStrengthValidator;
use Rollerworks\Component\PasswordStrength\Validator\Constraints\PasswordStrength;
use Symfony\Component\Translation\Translator;
use Symfony\Component\Translation\Loader\ArrayLoader;

/**
 * Password checks
 *
 * @category  Util
 * @name      Password
 * @package   Galette
 * @author    Johan Cwiklinski <johan@x-tnd.be>
 * @copyright 2017 The Galette Team
 * @license   http://www.gnu.org/licenses/gpl-3.0.html GPL License 3.0 or (at your option) any later version
 * @link      http://galette.tuxfamily.org
 * @see       https://github.com/rollerworks/PasswordStrengthValidator
 * @since     Available since 0.9dev - 2017-09-22
 */
class Password
{
    const DEFAULT_NB_MEMBERS       = 20;
    const DEFAULT_NB_CONTRIB       = 5;
    const DEFAULT_NB_GROUPS        = 5;
    const DEFAULT_NB_TRANSACTIONS  = 2;

    protected $preferences;

    /**
     * Default constructor
     *
     * @param Preferences $prefs Preferences instance
     */
    public function __construct(Preferences $prefs)
    {
        $this->prefs = $prefs;
    }

    /**
     * Get pasword strenght
     *
     * @param string  $password Password to check
     * @param integer $min      Minimum strenght
     *
     * @return ?
     */
    public function getStrenght($password, $min)
    {
        /*$validator = Validation::createValidator();
        $violations = $validator->validate(
            $password,
            [
                new PasswordStrength(
                    $minStrenght = 5
                )
            ]
        );*/
        $translator = new Translator('en');
        $translator->addLoader('array', new ArrayLoader());
        $translator->addResource(
            'array',
            [
                'Hello World!' => 'Bonjour',
            ],
            'en'
        );

        $validator = new PasswordStrengthValidator($translator);
        $violations = $validator->validate(
            $password,
            new PasswordStrength(
                $minStrenght = 5,
                $minLenght = 1
            )
        );

        //var_export($violations);
    }
}
