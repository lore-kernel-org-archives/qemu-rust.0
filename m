Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1trZY1-0007Lz-W8
	for mharc-qemu-rust@gnu.org; Mon, 10 Mar 2025 05:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trZY0-0007Jd-OU
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 05:35:44 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trZXy-0000jQ-RB
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 05:35:44 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e5372a2fbddso3335982276.3
 for <qemu-rust@nongnu.org>; Mon, 10 Mar 2025 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741599341; x=1742204141; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYjSLSI/JF31DeL2Hzt5bfWPChaocBihOeKgkMjAfCo=;
 b=caG44BL+bzcJbkP6TXv8NzJMtzGGXsYYwD7Vkm+yzpyaygAXq9Xu19kcUaceCpv0qg
 YL7qYU7nHW/t3J3vXzEmEf3395XVcUR747OovCdWB7Oogls386HOP4BuMCywuFMutLzo
 ib1/zBldkjpQKNR2eHjbklgZH98F/pHzuUnSrwjeWKzbAoHQehhAVzEG/wGijM2/nmwa
 RGMnDtq0jCQ9YJ209GWc/IMFpofJMxPrzK2HbXH43oEI7xAdW7NnHcF5dl9RHhhFdCrD
 xSsTN/ztxPTRAgUb9zg7jZz1+ZDahts5zHLxjnMoOyI5ruMeEvv+OYCC4LtbKle511eC
 Lqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741599341; x=1742204141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYjSLSI/JF31DeL2Hzt5bfWPChaocBihOeKgkMjAfCo=;
 b=dunO/dt0p2fn+fLgG2lzxiiDwZ1mFaAmzAKMNdomudahm3WQ1ekO64IHKHYTu/0pzD
 a5H2EipS5gYynLVXzT8fB/yBwMnstDNhBnlevgA6G9CnaMPNrm+/XTPdvy0dG0xbWH8x
 oVdAU2ET92KFxI0aka+wXtwl5lulmiYv+ESdkKkVpPnq7GL+G5t+gMvKjvh/gIEbY7kA
 A3I9Gy9XM3Am7oSRq9S8Aacc8cqH9KYWB6AVS6fdFcCtnsyVcG1qHuVEknPRMrUAB+rQ
 4RWK24SyUXxPH9MqEC0qkrPB09J6DshKhIT+l+kdbsOViNt6iQvPN6DtDb7ZOHazRdme
 6Lsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM6qf4OVEfyV2lKYXSxbOofOTAb0XBNj5g8ZeJt1s1Q3vBIPKPHbwbuRb6jpGQyYrzoQPAu5RuVdk=@nongnu.org
X-Gm-Message-State: AOJu0YxD3FMc4qSZuaG7S+kd7qetTpJbjc2L0ZEaKoJ3kfYrKiHumftq
 /nHGbZA3mC5/NeRAQXqi79U69KqQ0lDKTVMIzfhY89jjW4lVvDp1jJSsvgEkpyZUmv21dNbimF7
 2fHp/1tY8ewRNnyRkM98KF/eLzhLUlzsMWZ3CeQ==
X-Gm-Gg: ASbGnct35p3D0AbYAlOlxWD6Tj/P8eD032uSmhFOdNT5CBz0eBoRZoCnkT60627Lhyp
 ROwxsTbx8p7+YDOCYlsWVx3xQjz+3eHAnZUVOPEJHFtdZCCzBRI9ShaHKZ1IqKExWZ7Higx/eZk
 GOXFpLTnUlRY8dnRj7oT9K1cfFIQY=
X-Google-Smtp-Source: AGHT+IHeT3/WKMRAqqFMd8Pa89sRWev3dCma2wKazS99nKyKT1UIUmQ0P1roLYqNHo1rifuluYlMvnCBBgu6RjGbM+0=
X-Received: by 2002:a05:6902:2207:b0:e60:a525:264e with SMTP id
 3f1490d57ef6-e635c1ee47fmr13860227276.43.1741599341226; Mon, 10 Mar 2025
 02:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250129082045.1319203-1-pbonzini@redhat.com>
 <CAFEAcA9=G4sdXrxWcmq9wMqu1-ZRNxObQD3hmnFauYwiQr_8YQ@mail.gmail.com>
 <Z86v8Y70sGThWb_V@redhat.com>
In-Reply-To: <Z86v8Y70sGThWb_V@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 09:35:30 +0000
X-Gm-Features: AQ5f1JqlZXM60Kj1NBNC0h-Hj9mI5bUyzSNBwbF4G_k6EiTp3aKLMZ2otHjO8F4
Message-ID: <CAFEAcA-X4xsihFLpUUb7-AGOmYt9p3_m04Zwr1GORrf_qij+oQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: include full Rust backtraces in test runs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Mon, 10 Mar 2025 09:35:45 -0000

On Mon, 10 Mar 2025 at 09:25, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Mar 10, 2025 at 09:21:37AM +0000, Peter Maydell wrote:
> > On Wed, 29 Jan 2025 at 08:21, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> > >
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >  .gitlab-ci.d/buildtest-template.yml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/build=
test-template.yml
> > > index 39da7698b09..4cc19239319 100644
> > > --- a/.gitlab-ci.d/buildtest-template.yml
> > > +++ b/.gitlab-ci.d/buildtest-template.yml
> > > @@ -63,6 +63,7 @@
> > >    stage: test
> > >    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
> > >    script:
> > > +    - export RUST_BACKTRACE=3D1
> > >      - source scripts/ci/gitlab-ci-section
> > >      - section_start buildenv "Setting up to run tests"
> > >      - scripts/git-submodule.sh update roms/SLOF
> > > --
> >
> > This will only add the rust backtraces when the tests
> > are run from the CI logs, not when you locally run
> > "make check" or similar. There's probably a better place
> > to put this...
>
> Meson's  'test()' command accepts env variables, but it'll be somewhat
> tedious to add the same env to all case where we use test. Might want
> to define a common 'testenv' set at the top level meson.build and then
> reference it from every 'test()', unless meson has built-in support
> for globally applied env vars that I'm missing.

Or we could set it in tests/Makefile.include :-)

-- PMM

