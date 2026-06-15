Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F32DCD98C5
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Jun 2026 08:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wZ2jf-00039o-E6; Mon, 15 Jun 2026 04:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ2je-00039N-Cw
 for qemu-rust@nongnu.org; Mon, 15 Jun 2026 04:31:58 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ2jX-0007ai-GV
 for qemu-rust@nongnu.org; Mon, 15 Jun 2026 04:31:58 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66061993294so2905579d50.3
 for <qemu-rust@nongnu.org>; Mon, 15 Jun 2026 01:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781512310; cv=none;
 d=google.com; s=arc-20240605;
 b=N5eQjeeN7ALU7Qep4n0grHEGW3738A3f1C4saeVMWDPEwAENTueKe6gVZPDL2jpXsL
 wBVZUB3mZc79y4vJ8Qf4NaQIkyLf7KRgkxMQl859whnf+988iiI5PgLGMnbBHjFCK/Bz
 IVJTRI/1t+bR7UvHFMriPkk4nNAETiUWtGOnzowzJZMNALCkFU4RwoGPDbv27JqzknNe
 WL54vmg3d7bTftbonPKtN2TgwhJ7s4tKe7UpPvadF7NhJ7+h86f5UWyeAQir0d14NC+x
 Wdmy8nLbttgZ8UFMVqeAdq1tud/PX8A95Cc/9D0xEXiG4jmJllClihP/BnWcZ+qeRMxm
 MaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XvG3exdGiJGNjD45j3sqsnKPQTVp+Y7bsmGB6J34xnw=;
 fh=2Y46UD+xdyupr4CsP2sNmC15pH3aOjiWWbhOQYS+YgI=;
 b=OVTu5ixyx1h6yfhnRZhpV8QNw1bFaZ5DHmS6vNh1vFKbiCOIL17yJ+WHBqP1CnAWyP
 aZfgJKwf2X1ziKBnonGNPwxZK7wTnxcIvc+BWUphBY1W9hu3DqjnWFsq4kTlM2wuvckp
 lJFNGHxGK0LuVa0yAbb4ZIi2hIGM/tUsG8Q9jguAM+OW03U7tYWCdNyYWp2IkF/8GkdB
 7SWFZsTqlQIEVt89+VQqs9tkRqhGQhd/UDzU16BHYRy32/dY5JwfSudsWJ8FqaSI9EtQ
 MzF0UdpclXCQYGbvxbqqJ2ZO7KKnwItpYxR5xL9meWvaXhETngfcfQdMYFQ+/MXu4ll5
 fyeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781512310; x=1782117110; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvG3exdGiJGNjD45j3sqsnKPQTVp+Y7bsmGB6J34xnw=;
 b=Vhu4aC2TQEKO5bgxQiX3yV1TJA46VV2bPjOlGrEUEBZy4WH5qvW7Sq+5l20zvWeSOH
 NK9vhwuxYwLGHLY33v9wJcWBNb5poujGQJgEYn2GG4YIGmqDDiTPC5PF3UFC0u1e8C/s
 3izpFUH8Hga90a45lv0aVbjdArGgB0aOCimbTkhSIo1c8slzOQFuqVC+1WW9iS36FSkJ
 276+OsjQ0AghrBglJI9ddcZhJrdgk24YIZQYxfw4bfKELa0E5RDU4HV+VHsKewalT/Fs
 ApztY8ACZe4xIV8aMe5QsV3vPKsORV+Vw824oQ2Cbr+/kjT18iHDqe3LoIuF7hmWQEeG
 YG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781512310; x=1782117110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XvG3exdGiJGNjD45j3sqsnKPQTVp+Y7bsmGB6J34xnw=;
 b=kB/HSsow0zuVWb+4Miv7L+o9yw7pf01zhU2pHDz2ZaATtg+MVmu+3z5T4NiomTeCz2
 Cw/CtcMKgPV4MUooovlC9pe4pwLTK9Ho6f7etHw/0IcsTs3kvhxqLUXZijBYWi94e8YQ
 YCXI1jzQVzHKb1bDGuMMn0ZH52nSOohJ7lxYrKJpIX1wZquOR1RFJDrOQpMtT9RymDmq
 f1B/T09Mat4BTojzveaijYoMehOVuQ/7sHztlKxJXllnrsRSXgf2ct9PQnDJlwPmAill
 4IPqzjwsfjPgPjTOnR4h4+BiAXhE8/6+ooDkuW6LMfvToAhmwO+TMRdumQhhWnISw/e/
 EaVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+tlO3Wj34HGVaZCBHveh+jHsZdjkqw8wf+Ejk5wMH/RWKLKcjxzNjU1G3auGlto+QAkRo/ZqZQTig=@nongnu.org
X-Gm-Message-State: AOJu0Yy+t+7xqYjaSxCxNSVOSBRAov+oCwoOmUEHfdwXG2D8XRAgqVc/
 XVYjDapg8n7PSJk9vOWGBZK+8ux4bAc0v1liNauplBvoWDtSrv7VqMFnUJY54hvAguC/f4jQCAF
 YliForQdwBGoLev+36Wsk/KeNqbC4rBl9JjUNTMuH7w==
X-Gm-Gg: Acq92OF/Og2/P55tK26qUMVdW+D3F8dWt85DO/upAkqOVO6eKsmUUGNJhDVL3kcaCWN
 ymD9dYsEaIYantabqBf2hn87F0fTxNKaHg1pucnoJE6lsY7gmf8uqEcvoYmu99ReJiLpsA6HKvV
 dhzorZEWoEZwOxgn4zP4ENKVGBD/NF9m2gRUNV0YcMNYIsmUS2kf8G1XntBrFNuA+511o0hyB8a
 NDAZ6NASE8fMprkVtfBSKDo2i4Dt+l82wB8+4AEiLHPfqOigzG5Gh3uzsan2P/ujufFfEVAmbvC
 JtvzXKX/vbZX0PRSIpH4rdTS8sRVmx0KLRKy6wYZaJaJLlbg/gNR/iJtiMAxmEbBttE=
X-Received: by 2002:a05:690e:190c:b0:661:1be:161b with SMTP id
 956f58d0204a3-6627837c3bbmr10865707d50.56.1781512309811; Mon, 15 Jun 2026
 01:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-embedded-v1-0-bb0c65bf126c@rsg.ci.i.u-tokyo.ac.jp>
 <20260615-embedded-v1-2-bb0c65bf126c@rsg.ci.i.u-tokyo.ac.jp>
 <ai-z14dMCK33_pis@redhat.com>
In-Reply-To: <ai-z14dMCK33_pis@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2026 09:31:36 +0100
X-Gm-Features: AVVi8Cc4gi7a_SUgEXm8D-PR5l4cbaN47lQ8aHYhgFhq9Vs4k4PQZLPga7J-chk
Message-ID: <CAFEAcA_nFiQyXyCuvwUrJ+-0fhmGoMfswK-+KsZbxahAGatTXw@mail.gmail.com>
Subject: Re: [PATCH 2/2] qom: Manage references to embedded child objects
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 qemu-rust@nongnu.org, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Mon, 15 Jun 2026 at 09:13, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> Do we know how many examples we have of embedding objects inside
> another ?

It is an extremely common pattern for device and SoC model
implementations; we've been recommending it for years.

> I would much prefer if we forbid the embedding of objects. It is
> horrible design practice to have some QOM objects which can be
> freed via reference count and some which cannot.

That would be a very large amount of code to rewrite to the
new paradigm. I don't object inherently ("you have pointers to
your child objects" works better when they might be implemented
in Rust and might play better with being able to create
machines and wire them up on the command line); I'm just
noting how much work it would be if you wanted to make
embedding forbidden.

thanks
-- PMM

