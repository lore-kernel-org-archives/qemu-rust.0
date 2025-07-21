Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2457FC83F25
	for <qemu-rust@archiver.kernel.org>; Mon, 21 Jul 2025 11:01:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1udoH5-0005sQ-V3; Mon, 21 Jul 2025 07:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1udoGi-0005R1-VU
 for qemu-rust@nongnu.org; Mon, 21 Jul 2025 07:01:17 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1udoGf-0003P7-G7
 for qemu-rust@nongnu.org; Mon, 21 Jul 2025 07:01:16 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so8624771a12.0
 for <qemu-rust@nongnu.org>; Mon, 21 Jul 2025 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753095671; x=1753700471; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mNsr3nNXisLRdJ+nUNFO0seRIkM6zyOtDnst5gXhPk=;
 b=ngN2U2Ci/S5xDecQbNUk26X9mvTAYF9L87q2dpjUbXKM96FH15eTBAK/+fy5t473DP
 GfBRNCXGKLAb3PBK1QCC2yzXH6/NhmbjzYjzS8oMpFH/f9exoHDmBHCPsBiNqGj3f8dE
 Sofq9/ZmDV+N4MQz/gDgV/9kp32OqPs2NFj+cKS6l/RCh//y8GkSJIAC/ZBSke1xNr06
 Ibe+s9rhevgswrKBA4KzQw3zYt8l0M/9aub44CUPm/5opx5CJGMYRsCXs4VZ/6TtNszI
 o4/MkEwsPiNeUOH/eyeM+/6F7aoCA68Tmhbu7W0umCUUpk15foQgu0gyC8u9pdMprL13
 NkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753095671; x=1753700471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mNsr3nNXisLRdJ+nUNFO0seRIkM6zyOtDnst5gXhPk=;
 b=maqOVprU9r3hLovszeDEZ3zfnvjsORe7k60g3Cil9MrKAGDeg/z+SthbW2Rqj9ZC9o
 43bLwCtMlThw1DN81REP7LuI0voM0mSc17iHoQ+61O02YGh2ARZa8kkbsa+mYcZfn2xL
 7B88ASs/GrQIJnt8b2fxtRbrPAfNz8LQb2PUbHBTkXTNfcmRELwfwNvEcp4dZi2++Yps
 p5Zn8zxncFXIy6ZfYnYtWGCWut2GLCw6U29oN9rCthlvyCjwCQGMJ6dh7WRBDm7mddcV
 AxTJ8Yk0xLDOytZ9+DnmhvlI1Mki9YSlpKmD80Y9fj0FYG7gJ7JxKfN8WnjEN7QbEImF
 FN8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQEXNuEswig02VmF+x+hET6rFv+W/zoXw/DbaReuLRi9gXVl+HhYI/ZPfH5pi86UwHKuM2Nijc/9I=@nongnu.org
X-Gm-Message-State: AOJu0YyTWYEOoX4mpDuAjT1HG5aqcByBKNXIUbxWtj2wtF468MNQz7/2
 ZFySalUCrqVASF5k1wxkv0ope3Ga5AeMG6JFUGRqyXnFjIYJIJFjsZm9pHHJTdRByCEgHGUKcXS
 A78Kv2ttPPTYFEplCHzrS81Ir1ucTEidPYbdy/QcCng==
X-Gm-Gg: ASbGnctVLzmeks56dTy5v1lL0fzB2RaN0RxgWtHyfd+dgSmcxFQxmc6KtTJkVjQna+o
 YFvUOsg/DDPHoTOkBsbz8aMqI2caIz9j9fc0qsZDKVKYSoZ1jYar0Aq1wmz8Vt7ehOy3ZZctq36
 7mpkjvGHPu6u2++xSwCfnWHIFsGRSKY5uLLq/+FZa+sTS9mwwU3/+kiOd9FePXNjiO1d8L69e5A
 Qi8DQ==
X-Google-Smtp-Source: AGHT+IEZVfhRNCMIakfJnCWYSc0DOhbFAYzyqdrBnIDVT3hsUBS4A8ChJyolMA381vWEfR45lawbY0oeffzK+CY2B5E=
X-Received: by 2002:a05:6402:2087:b0:60c:5853:5b54 with SMTP id
 4fb4d7f45d1cf-612c10143eamr10764522a12.14.1753095670434; Mon, 21 Jul 2025
 04:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250721105238.461477-1-pbonzini@redhat.com>
In-Reply-To: <20250721105238.461477-1-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 21 Jul 2025 14:00:42 +0300
X-Gm-Features: Ac12FXw4ifdXQz_mtl1x4Ky8M484xDkE2fhz6N5iHtzaBUrzCZJweInGWT9Lkko
Message-ID: <CAAjaMXY7aO18R+0S8fyB0ageb1D_8gd_HkFRsDE80Qa8ECWiBg@mail.gmail.com>
Subject: Re: [PATCH] rust: devices are not staticlibs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Paolo,

On Mon, Jul 21, 2025 at 1:53=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> This is only cosmetic for now, but hopefully later on Meson will parse mo=
re
> of Cargo.toml.  Devices are linked into a staticlib but are not staticlib=
s
> themselves.

Does meson compile them as rlibs instead of staticlibs?

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

