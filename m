Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tg4Bs-0002P1-Sa
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 10:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4Br-0002OT-Jw
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 10:53:19 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4Bp-0006zj-EN
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 10:53:19 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e455bf1f4d3so812121276.2
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 07:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738857196; x=1739461996; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
 b=moMpPSGaIF1Z2l53excfJmI3m2RGycFC/x1xK9te+HNQ+D34/4ys/CrLue2DBAJvlf
 1O7J+2tl+KLQULcwtedCwvcjF6prDBsxdIHVt8olUlOtmYKM8lmn+W0TvUL3KUBTE+St
 6hyyg6OzY3S56XqQ73LCEdSynRkpfbobSE8OvS/hcrPVrjhyYe2fyEpAjQwTuWKga2py
 B17f1mcspC8hrHaKPm4/6adrxgPj/awOxLm0wtn8HXaRAVxOwsBA5iufSN/7vfht/w39
 9KMNoUpJsMZlT6GZl3BvaWZn2HmoP2+3IBNTgp+hjxmM4m60YsetjmxyoJDf/XDyoXV+
 IP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857196; x=1739461996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
 b=vOPg5AGFW1tLz7RO2WCr4XeYylPI3CKMbf2EU2fW5ygUyningag6/X/v9/udxmSwYI
 jq4UedVy6hW0Lnkga4STco9yV4IqqVFY8wW7arbTKlxpRDoS0FHWzKJHP3PIfLkvH5hM
 mb1ZIAQQbKp/Rd38FqiYUq0F/BtVcv46aCFws25DJKW9hwjYcdPGxT876jSRAaLnCVif
 FH01pj0rU9fo5UEY42uoLh2bfCmwCdb4goof8AusZPcDcQo494jE2SXMh29HPUGHkVVk
 RXJprNDmgoSy7yCWupLwgOFdtVFtzizWl1QhR4it2rKT5PKAHHmXAlGSGSvnVuDbV4VO
 sliQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXab6ge0mrk3bDfZt/LbMvbc8ev17L52QbIadrmrHMnoH1HCUXLSGwj5iIBbO6oBqo7YqYiQE0ejIY=@nongnu.org
X-Gm-Message-State: AOJu0Yx6SbZJNTYYWK/mPsYqU67FWYiCryoCNz6YUgHPv74oBYC5Rc+k
 mKqgN5zVQ+RS6rcCmvDsOJaNF1mF4cvHi93siREjIMxhfGhy6bPkiNq6MQQhIKW2Iy7IluQN64x
 Pk3Q+AnsJMeA0ATYkDUvOALgZN9Fh9nwn1cRd8g==
X-Gm-Gg: ASbGncsPeAq70wR9vnEoimlpPRQxA1G6zeg8Onw6v8skXVP6567LLexuxhm9u3g50gc
 qPpmGtff+RsvyMis5cp49temTFODQRchUWAiFK3R5FEF7boTHR3POeXw5HdqaBDy6RHQkqZ3rpQ
 ==
X-Google-Smtp-Source: AGHT+IH7se20k+IcZxopIIGWe8rNYHJ9965GJoItdH8fQqtHWEKQS0HtpBHMWxVRa1dfLgNz384z5mQm92UIUKnjmUo=
X-Received: by 2002:a05:6902:218d:b0:e58:8e82:5345 with SMTP id
 3f1490d57ef6-e5b259d213dmr6055544276.4.1738857196284; Thu, 06 Feb 2025
 07:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
 <20250203144048.2131117-8-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:53:05 +0000
X-Gm-Features: AWEUYZnHiVWrLGi-2zGS-ZXL0vgR8vDSrhzcIVVztSk6rKPjoO_A4eVt_FUbanA
Message-ID: <CAFEAcA9SnRrYGZVkB_NF=VSkSDtRQSvQjOPSid+HN4997Mwxkg@mail.gmail.com>
Subject: Re: [PATCH 07/18] Revert "util/timer: avoid deadlock when shutting
 down"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2025 15:53:19 -0000

On Mon, 3 Feb 2025 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This reverts commit bc02be4508d8753d1f6071b77d10f4661587df6f.
>
> Now we catch attempts to clock_step to the next timer when none are
> enabled we can revert the previous attempt to prevent deadlock. As
> long as a new target time is given we will move time forward even if
> no timers will fire. This is desirable for tests which are checking
> that nothing changes when things are disabled.
>
> Previously most tests got away with it because --enable-slirp always
> has a timer running while the test is active.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

