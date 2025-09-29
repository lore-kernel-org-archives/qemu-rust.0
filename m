Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424C1CAC5B5
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 13:02:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3DVu-0002ab-4L; Mon, 29 Sep 2025 09:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v39cw-00087x-Vs
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 04:52:59 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v39cl-0001AD-BJ
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 04:52:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-32df5cae0b1so5141067a91.2
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759135957; x=1759740757; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lafyTkYT1Ex9v+/Ov2/t60VCq/hVRywmsYuicIahjLI=;
 b=AwhIIdBaHUqHC6rEhjRb0LkyH6NUpihHvBdCyK6ApOWSGXhT3jQfY6lrY5n0DIk5oo
 Ij96SsLsaRRSAMUb1YqExh+2ODEU4mEbtsujSTUeowWGccT1vSMrWLpOsETOVKWxWzqY
 9+odKlBGUbCXkrIyZ21IEIUxuReNwFwvAgYUOQfjTNjL9nVSg/CDr137xcBIQsRBVIph
 FeXEzfxLRsXy7SiNIAiQ8xOgvPsXhRwVlH6SXLMcEt/b7vDqRZzieAOxuWhwPw8kC7rk
 nM1zPtrtN9OpTYy8ZyYUGrXlNjpqzXxDeRyVgEOxPngjmQ064d1v/q+Naii1aG8PXEW3
 LUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759135957; x=1759740757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lafyTkYT1Ex9v+/Ov2/t60VCq/hVRywmsYuicIahjLI=;
 b=hnyVP9/KH2QDSScSSCdrAAXSSahVbl6LpfsqDvTehpWqCkSm6swFw8QqAo5a8ruHgN
 3nZtDhT0A1ipHBYUBcS0HIA//UachiNIZEefbtzFvkoINENYQ7/ytaY8xk60JH6B1Xko
 7RSRgYM+O7FhNGZinQgIJ6JKiiP6TvsSZdi4TtF1Lhz0KF1KqtgjVWk9lWN1QbfIS46N
 vEEPUXt9s/mGwUUtSzvmONTJuxioK6Qs74/FZOrBI6et07E0llS2hs+dJUBivSBh8xKU
 w33f7k1R1hgk/Sa+XaVIw1WiAcnfafCPWgQ1IbtXQDiSRXWTH7Axy8pY5572GYw1XkIg
 smeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/h7gnMi1iPw/jY82V8DfP5tima2HrPVVpWj8xxeTdogI/OomOSLj2Yab+DxfHWrvZwQ4PTaQIIdI=@nongnu.org
X-Gm-Message-State: AOJu0Yyj+YBxhNkZVQA1tNPyx7M8NsGPP6yUf1kVG1R8jPjGoXIqO7BI
 t0L0jnKoqdPOHU8s8zx6whF4nb+CTkiDVQ556LnsBJDwHHo/ex7b/Uc0Gqlxq81qf+OIERauWtI
 g82ujjL/Pf7GlnEPxSPYBcgNyNn5zFUE=
X-Gm-Gg: ASbGnctZp7w1kRs52OMGNYUIpAe+OiXtbvZgaJWK821js3mQzSbKXbcBM4sqrEXw5xB
 JKhOzmOIGa3MDeHzPnhoNRlEn0a+d9h5GH/IxsSD9LnruChMhmA1QOwt1V/D1JZLExULseNN+q0
 NHhnJg0t+pOgmgL+3+nms02NwLmWW11tHrco5GGdcjhGxyNsjKOuGn4tqe5v6PsmbGtIrfcmgBJ
 vTHjzhvYkobTli4LNaQdh3M3FU0PJJJlA/FNHujOs0iDb8/
X-Google-Smtp-Source: AGHT+IFkH+L4hE8LeLLWqYd01Zs54AFlNhodlCJYMweIL//Z3HDNqEDpsa8zTPyQRH14KZrJKif2WgP98Ke2simc2LE=
X-Received: by 2002:a17:90b:1a8f:b0:32b:c5a9:7be9 with SMTP id
 98e67ed59e1d1-3342a2c6a0bmr14756810a91.25.1759135957314; Mon, 29 Sep 2025
 01:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-28-marcandre.lureau@redhat.com>
In-Reply-To: <20250924120426.2158655-28-marcandre.lureau@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Mon, 29 Sep 2025 17:52:25 +0900
X-Gm-Features: AS18NWD1-qwZmnd1dinzPXohwgLqCxRefqg_5VIJeSlNYmT6-h2wzUvtSpicHxQ
Message-ID: <CAEDrbUbOWp24F_wO88Tb9ZCM8Q+jXEK_1BzwGMwC3MG=3TzgAA@mail.gmail.com>
Subject: Re: [PATCH v2 27/27] WIP: enable rust for wasm/emscripten
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, 
 qemu-rust@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d8efe4063fecc195"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Sep 2025 09:01:57 -0400
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

--000000000000d8efe4063fecc195
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

Thank you for working on this patch.

> wasm-ld: error: unable to find library -llibqemuutil.a

This issue looks similar to the one in "[PATCH v2 24/27] WIP: cirrus/macos:
enable Rust" so I tried the upcoming meson change[1] mentioned in that
patch for the wasm build. By also applying a patch for disabling the
"verbatim" modifier for the Emscripten build[2], I was able to avoid the
error.

However the test build still fails with the following error[3] which I'm
currently investigating. It seems that meson invokes rustc with duplicated
linker flags (e.g. I saw three "-lstatic:-bundle=3Dglib-2.0" flags in a sin=
gle
rustc invocation) and rustc doesn't seem capable of handling them.

> error: overriding linking modifiers from command line is not supported

Aside from the test build, I also tried building the qemu binary. The build
succeeded after rebuilding the Rust standard library as suggested in the
documentation[4]. If you're interested, I've stored the patch to [5].

[1] https://github.com/mesonbuild/meson/pull/15024
[2]
https://github.com/ktock/meson/commit/afd0366d1fafe0cee2915d4b60bc2b523e3c1=
c02
[3] https://gitlab.com/ktock/qemu/-/jobs/11529682431#L3287
[4]
https://github.com/rust-lang/rust/blob/5b9007bfc358817cf066ee27c6b440440727=
d3a7/src/doc/rustc/src/platform-support/wasm32-unknown-emscripten.md#emscri=
pten-abi-compatibility
[5] https://gitlab.com/ktock/qemu/-/commits/test-rust-emscripten-c

Regards,
Kohei

--000000000000d8efe4063fecc195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Marc-Andr=C3=A9,</div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr">Thank you for working on this patch.</div>=
<br>&gt; wasm-ld: error: unable to find library -llibqemuutil.a<br><br>This=
 issue looks similar to the one in &quot;[PATCH v2 24/27] WIP: cirrus/macos=
:<br>enable Rust&quot; so I tried the upcoming meson change[1] mentioned in=
 that<br>patch for the wasm build. By also applying a patch for disabling t=
he<br>&quot;verbatim&quot; modifier for the Emscripten build[2], I was able=
 to avoid the<br>error.<br><br>However the test build still fails with the =
following error[3] which I&#39;m<br>currently investigating. It seems that =
meson invokes rustc with duplicated<br>linker flags (e.g. I saw three &quot=
;-lstatic:-bundle=3Dglib-2.0&quot; flags in a single<br>rustc invocation) a=
nd rustc doesn&#39;t seem capable of handling them.<br><br>&gt; error: over=
riding linking modifiers from command line is not supported<br><br>Aside fr=
om the test build, I also tried building the qemu binary. The build<br>succ=
eeded after rebuilding the Rust standard library as suggested in the<br>doc=
umentation[4]. If you&#39;re interested, I&#39;ve stored the patch to [5].<=
br><br>[1] <a href=3D"https://github.com/mesonbuild/meson/pull/15024">https=
://github.com/mesonbuild/meson/pull/15024</a><br>[2] <a href=3D"https://git=
hub.com/ktock/meson/commit/afd0366d1fafe0cee2915d4b60bc2b523e3c1c02">https:=
//github.com/ktock/meson/commit/afd0366d1fafe0cee2915d4b60bc2b523e3c1c02</a=
><br>[3] <a href=3D"https://gitlab.com/ktock/qemu/-/jobs/11529682431#L3287"=
>https://gitlab.com/ktock/qemu/-/jobs/11529682431#L3287</a><br>[4] <a href=
=3D"https://github.com/rust-lang/rust/blob/5b9007bfc358817cf066ee27c6b44044=
0727d3a7/src/doc/rustc/src/platform-support/wasm32-unknown-emscripten.md#em=
scripten-abi-compatibility">https://github.com/rust-lang/rust/blob/5b9007bf=
c358817cf066ee27c6b440440727d3a7/src/doc/rustc/src/platform-support/wasm32-=
unknown-emscripten.md#emscripten-abi-compatibility</a><br>[5] <a href=3D"ht=
tps://gitlab.com/ktock/qemu/-/commits/test-rust-emscripten-c">https://gitla=
b.com/ktock/qemu/-/commits/test-rust-emscripten-c</a><br><br>Regards,<br>Ko=
hei<br><br></div>

--000000000000d8efe4063fecc195--

