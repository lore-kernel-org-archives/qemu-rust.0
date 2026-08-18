Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A10AC5DF81
	for <qemu-rust@archiver.kernel.org>; Tue, 18 Aug 2026 19:17:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wwPIe-0004q8-7f; Tue, 18 Aug 2026 15:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wwPIc-0004p7-Cx
 for qemu-rust@nongnu.org; Tue, 18 Aug 2026 15:16:38 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wwPIa-0005V9-Rv
 for qemu-rust@nongnu.org; Tue, 18 Aug 2026 15:16:38 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836ce6cbe1eso4385867b3.1
 for <qemu-rust@nongnu.org>; Tue, 18 Aug 2026 12:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787080595; cv=none;
 d=google.com; s=arc-20260327;
 b=q9ApsPczU0X5nqR+MfL2VfWf4ZIUlXi3pG96MuEVOELlD5JBind/ItxakOFywoWf8C
 Rqc77NpKspPMknpuwGAsDjHqznTSN6QqbCxlaxC5XGKvZM89cBe9cb8B7mJrqzxOY2it
 NqoZ+T7KHyWgHuBflAxMtZCCnIJl8EVSUTrpryWP9af7XxMLAglRBXkAjwpois+3hSa4
 oiZ84r3NR5nMJ9/6YyKVHT0xBO85yIVs8IvLUsVvAUONor0mPnRM17bdhz41P8ayVX+b
 H+0VuRD24rxmjQ3o4uqrxYn4z206zeocHj9Z12xmkB1D+mP/n6cElRBKOLA5G4bM2Hsm
 +xHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Gfo1fcQMOG0fs+7GAP6s5UlMBuoaL/60+LuEPass6K0=;
 fh=5jMlQSfiVswh9O4Y9atz749sijdNNT2qwFFWxMC1nzI=;
 b=si9A12DvoK5SbPv871UJVRc1K3/yKTC3pOx2snFqokPAwcfIQGuPdcLImUYYV+N4OE
 5nAomh8uKOLtSvKUmy97QiLZMY7RxudEmxAcb+7B1Ok2Os2AfEEYGq3efodd9LqIe6wL
 ymIJ1BcPbcWrKUMRqT1r/nYBZNPCXKnW2g0gK2y1xUwJwgMYBIInbd0mi+rg40uoS6h7
 tkiqU8wVidT5+IKHagCg9h4ZM/nfP8/JTFTbd9QYiFHiE8EAKJPni5B4oFOYuUzuFIrr
 prgJ65rnXHQjhOPmEV+O7q+NqmGRng6ZQ0Go8PmWN+NUCIVzl6WXImEG/jffXRd5bMeM
 nRSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787080595; x=1787685395; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Gfo1fcQMOG0fs+7GAP6s5UlMBuoaL/60+LuEPass6K0=;
 b=rTExtmUnBCj5q5+DZrFKdbNqXYsF05tHyClH18cP6zQJK+GK5w3BuWJuS+bgmuxX/G
 atCXtS/+SBWWh/ogc9AhLozdZ2HH1NFaahpkYazsgRPIV4rZ8P68gXE1O4LxEhpWiZ/Y
 IgG6F5AUf+UHV+51JqA0zIYCliV8vmGC/v7aN7ztIC94oe5NnVqbK65gpKgZVgIppTOt
 Q0al1zDccKzF5L0J4c3N/ddeA0yKkC5JRNryRXnnedjyg6/Ihbj7/SJ3IN0zPq28tbTD
 qL9DLJ464Ni0EehJV14cm6eh8pzpSXMnhdW0oJbRvQLC0Xesayp4r0F+SdMKcGUF6S/9
 4t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787080595; x=1787685395;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Gfo1fcQMOG0fs+7GAP6s5UlMBuoaL/60+LuEPass6K0=;
 b=ZO8y7a+Wt2fZsNN6p/vI4ColiUra7zOdkMbbNxLHtDMxs4rVJwxl1Mbhr9bN2vBqJM
 Qn6VX8r2dNCjtE/7gyqx090RucgRMthIVMaLysFj2Vp1srJNLN3rltm3aK8CLtcsMBFE
 3sBUiOTa0GZQqM1dE0GVvxVmrKqwx/ctOJMJFeP9/+WT98CIdPbL5iKnaycU70T4C5m9
 RCOBv60f5fUjvHVnDoPS7axCRkqqkJkODyX57VTGV48MJOHbjEQKUn7QkRpnyTPPx4GO
 HgHrKlCaO6Lm/JI1vPFUYkvL1/vOsxKZZ6mvYlvl4M/erhNmStBkq1x/jV3ppzgbxGQ7
 0MBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNzrZYvB/7DH4hKfV9p8FshjdRKr9OxcR1ryM0pll3c+PMjRGDxOO15ZwP0pCCIXxHZ3vgvNE5fS4=@nongnu.org
X-Gm-Message-State: AOJu0Yy2omCQy729E545f6IUcSgbjgXvKAi4xkGlg8QRjgE2YPZ62RZC
 Au9JL+5fb3ta4pvadw2vr0HA01U0baPNsTp/zldLUfb7D4IVj/0sjaGCbFtqG0B5f9HMFVG1rIF
 opAwDVuXeT+w2UrdAt4ZGd2EZOYe2J3Mvn3i+6+M=
X-Gm-Gg: AR+sD11dKir2+fDnLNdF6sW78hHRY/4BUtryc/641WbqxpJgpMupUwUJ9bRDDVGhQA6
 vzWxdrNsziRgYGIOZesRMdntQbWu1S/uaI3M6CNiT6a9KWvgf4ZtpO5TaYQdBHwle75mindsWF4
 eF5zRj6i5YZYQ1jwrahIZFz4lB/Nw50n6I3eqGOBuVKTNMXepmMWATrHhpvY70mMp2UeOEgFaj8
 G2ZF7JVf+vXD1okJ/L0UH0Q/ztVMY9dw3ItSNj/OUOILjOLDSVg/V08dXmO0rQup4TR0cCkWOOV
 9x5bQJzd90lDpFWuXx9zSNHC0GXDNSDDQWEAINmt1hHXydk2KFVJwQ9DdhK2D1p77eWbGgt9/A+
 1
X-Received: by 2002:a05:690c:30c:b0:81e:695b:585c with SMTP id
 00721157ae682-8412cd49515mr54982197b3.4.1787080595258; Tue, 18 Aug 2026
 12:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260817141559.940844-1-pbonzini@redhat.com>
In-Reply-To: <20260817141559.940844-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Aug 2026 23:16:22 +0400
X-Gm-Features: AcwNN1XvwW5YMXhVYoMrWB9w-axezlKHZiNO1hb9DW3ncIntMQJGlkIJJDlPhCw
Message-ID: <CAJ+F1CLWDU+o1jPkPtotn_LfhN=r+yKAMoyYACaM6hz4NjRkxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: switch from bilge to bitfield-struct
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Aug 17, 2026 at 6:17=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> The bilge crate is heavily reliant on traits and, because trait functions
> are never const, it does not work well with const; also important is
> that bilge's support for the zerocopy crate is tied to an older version
> and has never been updated.
>
> The bitfield-struct crate, instead, is built from the ground up to
> support const, and has much simpler code with fewer dependencies.
> Its use is pretty much the same: device code does not change at
> all, only register declarations do.  So, switch to it before it's
> too late.
>
> Paolo
>
> Based-on: <20260817134538.924615-1-pbonzini@redhat.com>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>
> Paolo Bonzini (2):
>   rust: pl011: switch from bilge to bitfield-struct
>   rust: remove bilge crate
>
>  Cargo.lock                                    |  71 +-----------
>  Cargo.toml                                    |   1 +
>  rust/hw/char/pl011/Cargo.toml                 |   3 +-
>  rust/hw/char/pl011/src/registers.rs           | 108 +++++++++---------
>  rust/migration/src/vmstate.rs                 |  45 +-------
>  scripts/archive-source.sh                     |   7 +-
>  scripts/make-release                          |   4 +-
>  subprojects/.gitignore                        |   8 +-
>  subprojects/arbitrary-int-1-rs.wrap           |   9 --
>  subprojects/bilge-0.2-rs.wrap                 |   9 --
>  subprojects/bilge-impl-0.2-rs.wrap            |   9 --
>  subprojects/bitfield-struct-0.13-rs.wrap      |   6 +
>  subprojects/either-1-rs.wrap                  |   9 --
>  subprojects/itertools-0.11-rs.wrap            |   9 --
>  .../proc-macro-error-1-rs/meson/meson.build   |   3 -
>  subprojects/proc-macro-error-1-rs.wrap        |  10 --
>  subprojects/proc-macro-error-attr-1-rs.wrap   |   9 --
>  17 files changed, 71 insertions(+), 249 deletions(-)
>  delete mode 100644 subprojects/arbitrary-int-1-rs.wrap
>  delete mode 100644 subprojects/bilge-0.2-rs.wrap
>  delete mode 100644 subprojects/bilge-impl-0.2-rs.wrap
>  create mode 100644 subprojects/bitfield-struct-0.13-rs.wrap
>  delete mode 100644 subprojects/either-1-rs.wrap
>  delete mode 100644 subprojects/itertools-0.11-rs.wrap
>  delete mode 100644 subprojects/packagefiles/proc-macro-error-1-rs/meson/=
meson.build
>  delete mode 100644 subprojects/proc-macro-error-1-rs.wrap
>  delete mode 100644 subprojects/proc-macro-error-attr-1-rs.wrap
>
> --
> 2.55.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

