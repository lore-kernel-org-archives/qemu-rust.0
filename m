Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D135C87FD1
	for <qemu-rust@archiver.kernel.org>; Tue,  5 Aug 2025 16:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ujKUR-0006Uo-8Z; Tue, 05 Aug 2025 12:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujKUL-0006SY-W6
 for qemu-rust@nongnu.org; Tue, 05 Aug 2025 12:26:11 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujKUK-0004ZX-EK
 for qemu-rust@nongnu.org; Tue, 05 Aug 2025 12:26:09 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso10027653a12.3
 for <qemu-rust@nongnu.org>; Tue, 05 Aug 2025 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754411167; x=1755015967; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctDD4ojVMW3xLQbxQJExtkZU5MhZUig20HBQ012Ftbc=;
 b=hRXPqPIKQyJ7s6tC6Rw0zpaOrNgVscctjBdb459TF7up2l5V6NrC6o5yu5rizDEeBa
 /9xplrn6CnqWDO5tk+XToqJpp5Kfa7SAuvDZCxPoaYjTDdex6DWnkrFpO/msSQIhXABD
 cRbRn4JgbqzE4ku4IWUsASIL3yNErJI2otHlcBYZmBgNr3HEGcD7RGyb6SVu2ut115NP
 yu700KQTqMdxqbsuIojeSd9weVtPpx7JoxlILFgolLlFvLW2jZaB+27cgtzYbIzmfHO+
 Rrq7eFe9oFh5jDAB8fZbiVGGZu5ZAwRXfQD58pSIHXCnv9izlWWDuJPE4elP3Kg1boUg
 nj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754411167; x=1755015967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctDD4ojVMW3xLQbxQJExtkZU5MhZUig20HBQ012Ftbc=;
 b=gOVFDbtqqaNeGOUS8OMeyv4styLinWQeXgjHKAjC8yYBYaFXmQEJCdCxL4Y8Wx43Ng
 DnQO+a2/ViHmvZidCQYk9hnnggkrFfKpizRjooQW9aGs+FE8ND435aQ/6jA5kQLMe+/f
 9SFYpQRrmUIsX3jRF6NUWueZ86gTMS6nIU3tCaCS4qthlOTCR6+36pTZFMJHsuVky4ax
 X/LpckM1lwrkfS4cszUGXQ7ji4ufEC6YU6fcxgVhmDUVvoQWVkpp4Cx4tHuRpIgU0AQM
 shZklW+IyEdapPrxJfn/6smks1Wt5obtsCRfate6Zqr47g+bunJSpRy2/Vww/tXc/pdp
 s73g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+cZK//GxuiymIWAbchVhMRqoOcTs5NhfN3A45XN4k/EVUeyNWoTKJ1GhcBZlxW8cqTtYyqftTebg=@nongnu.org
X-Gm-Message-State: AOJu0YyQo0nG7wLgxhYknaKypSX+ghm4Iu2FuSt3pDII7HxZcIHHWjvf
 +1utSbAYlKZbJvSrcnjmofBwuurez69p3KxPT/KM76FwtuTs3VS3IMtu1eTRr8pk5xSySihiSF/
 McY+LpS9+Qy2j8YysLNtvQ7nedRK9nk/9gN8qWN93Qw==
X-Gm-Gg: ASbGnctKb1uUC5/Mh8hElAdjk91OGN5hZzGetd0MFJTJngc9OasbLkUh1TkoD1NuV6N
 vuWnU2IOVKBbYAm3c/DuSMHchPULcCvs8fwyZsFrt5NTXKwOFQAe9BJ/e2GFJNvONpbubfyy/2D
 LmIq9rh+vYY3Hk26sBCvXhihdIGRsAWffU8tky9Ayo6wsSwveYeV6H4Azh507odQH79yJe0FQjv
 ux/LZ0T
X-Google-Smtp-Source: AGHT+IH34Xz+fR1TGDGWy5pZIgdFMck3gAUoadnLBvlwrVMYdNBeZ0JjOGaCkivCWqyfkahbZBOslvqPmoUooGTPdQc=
X-Received: by 2002:a05:6402:2790:b0:615:cc03:e6a2 with SMTP id
 4fb4d7f45d1cf-615e6ebec77mr11865486a12.1.1754411166572; Tue, 05 Aug 2025
 09:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
 <aJIrpoEhrl7aLBMg@redhat.com>
In-Reply-To: <aJIrpoEhrl7aLBMg@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 5 Aug 2025 19:25:39 +0300
X-Gm-Features: Ac12FXx8E0gmSgkarH0Hjtyobz0jylMHi8y9z6WEMl66GS6SogknlrgbBxBH2BY
Message-ID: <CAAjaMXa6ManykYJJk--vNZT7oeBW9UR2v6WixaaQ8LUCSjy9Ug@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] rust: implement tracing
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x529.google.com
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

On Tue, Aug 5, 2025 at 7:05=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Mon, Aug 04, 2025 at 04:47:13PM +0300, Manos Pitsidianakis wrote:
> > This RFC series contains some simple patches I've been sitting on for
> > some months to allow tracing in rust devices in a similar matter to C,
> > only it's done via a proc-macro codegen instead of using tracetool
> > script or equivalent.
>
> IIUC, this series is only emitting the traces events via the
> qemu_log function, and so feels like it is missing the benefit
> of tracing, vs the traditional logging framework.
>
> In our RHEL & Fedora distro builds we disable the log backend
> and enable dtrace, so that we have fully dynamic tracing and
> observability across the kernel, qemu, libvirt and other
> components with dtrace integration.

Hi Daniel,

Thanks for the insight! Do you have any points where I should look at
the trace implementation for how the different backends are supported?

So I think there's already work in progress to support proper tracing
for Rust, I only sent this as a temporary fixup to provide some kind
of parity between C and Rust implementations until a proper, better
solution is available that can replace it.


--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

