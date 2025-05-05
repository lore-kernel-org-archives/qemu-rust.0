Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBwQG-0005Lr-8h
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 10:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uBwQE-0005Ld-UX
 for qemu-rust@nongnu.org; Mon, 05 May 2025 10:03:54 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uBwQD-0007FX-8y
 for qemu-rust@nongnu.org; Mon, 05 May 2025 10:03:54 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6feab7c5f96so37488807b3.3
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746453830; x=1747058630; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5wuwsTYtqRrlPsDGUnJVyd05PNGJPAPPX6VA0y9An5M=;
 b=jEzOg2W+IIH//vAbuC1ZeAhIIU2++CxlNvXEQKtx9omeMS1/y+OPVZwCdTUYxOl+kq
 Iy+6F5ia0Ax0ZgPNHfChTs/nniu2vkXtx+EFvCBWnpo/vQq5qeOI33IqGmXoyJYnIUva
 /Z4TbQJDWSDcFLSxYKzOV6irRb2FL/M5D/Cjv+yclBU8iCYihvjgJvLHUAmfUJ/tqs2z
 ueDFtTe4O1Z2CrFWFGelbEWE2a6oYUU1OY6Z/2HarR4TbmLQTCK6IbfmkpbEgwQj3C2O
 voKPdmShMZ3VJFtXzcJOPYH5cQu54ubdHJdWu/Yl6u1ttborCZEt2Rgy2EZQ4XVCPaMF
 TVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746453830; x=1747058630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5wuwsTYtqRrlPsDGUnJVyd05PNGJPAPPX6VA0y9An5M=;
 b=G5iYHGWLvxV/Awj1JImJS8B/5EO8CyW8I0aHokCwtSdy+4znOEYDcSDZADb5wA2s68
 jO2m+jIndBN2W8EByv1V/dUTHHlidtdJbKaHbtaPvq1+Si89XF6fnUuxk07Qe5XhVhEb
 iUL3I/wJvJvIYNvaVzqPCuMQGE3mwUsaG2ty6JKYeqfeaN9CXZX580GXGfO6K9ylyhKi
 KG5Uzp0k/Is5HAujFAF9Ko5KZ7wzCN0PgzP9B+mLn94gCZ12ACT+LxGyGhEt9H7w+B5X
 J3PPoggPmniHRZRrdK45f6SeZM0x0ZSp9FxeoGV/EdvmHfCCpwEeNpGkXQ+825LSqWNo
 zang==
X-Forwarded-Encrypted: i=1;
 AJvYcCWckuyvDYmdFAXID5d5HprVNvvwG5fbFzkbmuOD2gfnAgx+NtcZqpV923jX5dCM3pl6OpBT391Psvg=@nongnu.org
X-Gm-Message-State: AOJu0YxgQ5LnDeXnCa1P2AAQ4Po73gdeGorQnFdByKQpa5Jg+drnFUPj
 w2a9eEJf8yrxL5v43Is/KQPFPpDFaX3rcAvTzSSpOqNT9mHPlDUQnwQvECpoV5k7DK0zTZ69CyB
 pECRhVKM1iCtwEepvsJcUaLKLrW+V6rSsrLyHGg==
X-Gm-Gg: ASbGnctIYVrlQnGaS3cE7cHV56SqRf0n7Su0uOdWQm3YF3XUl2OErz1SrGh6DtXDcG5
 MlnAyaP3SkTOBuMsKT1TgHJ5MYZ/r3I42yM7xBcQYGTDeM2QmeEB3UwtJ5WzWQg6W21Y3ZE8RN4
 uxitu9q/4jDonCBrk1jg4GynGBfQh8gj1FWQ==
X-Google-Smtp-Source: AGHT+IEs8vQNYjEOn6o3Nu80xsr9wz8oIJg6uRDByS2u6VX+piT2mF5VcllJrt9P8jhkuRIBbpMQiCEIN55jfIt7ZZo=
X-Received: by 2002:a05:690c:690d:b0:6f7:5a46:fe5f with SMTP id
 00721157ae682-708eaecba5dmr97796817b3.1.1746453830462; Mon, 05 May 2025
 07:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <d3d1944e-2482-4aa7-b621-596246a08107@gnu.org>
 <CAAjaMXZhq_uv-w_9TT3++HAcO7r_OhriJA0RKWs8YqY_ryjK4w@mail.gmail.com>
 <7101782c-f642-41e6-8f3a-7061ca722c99@gnu.org>
In-Reply-To: <7101782c-f642-41e6-8f3a-7061ca722c99@gnu.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 May 2025 15:03:39 +0100
X-Gm-Features: ATxdqUEoT1i0n9WnsfYxFEEcgZBJkKBjfqXji91UxITs-cnq4NUyGOvrnkw5Pic
Message-ID: <CAFEAcA_UvYdKT9RH0H0kppwke7GW-DxCHA+Wzdo+4cG4SSTPFA@mail.gmail.com>
Subject: Re: Rust in QEMU update, April 2025
To: Paolo Bonzini <bonzini@gnu.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 qemu-rust@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-List-Received-Date: Mon, 05 May 2025 14:03:55 -0000

On Mon, 5 May 2025 at 14:45, Paolo Bonzini <bonzini@gnu.org> wrote:
>
> On 5/5/25 14:26, Manos Pitsidianakis wrote:
> >>     Something I do notice is that there's some inconsistency in
> >>     how we've structured things between the two devices, e.g.:
> >>
> >>     * the pl011 main source file is device.rs, but the hpet one
> >>       is hpet.rs


> >>     I think it would be good to figure out what we think is the
> >>     right, best style, for writing this kind of thing, and be
> >>     consistent. We have long standing problems in the C device
> >>     models where there are multiple different styles for how
> >>     we write them, and it would be good to try to aim for
> >>     more uniformity on the Rust side.
> >
> > The pl011 stuff was deliberate decisions:
> >
> > - device.rs vs pl011.rs: the device was written as a crate, so it's
> > essentially its own library, plus pl011/src/pl011.rs would be
> > redundant :)
>
> Right, I think Peter's comment was more about moving hpet.rs to
> device.rs, and merging PL011's device_class.rs into its device.rs.

Well, I don't actually have an opinion about which is better: I don't
know enough Rust to have a sense of what's more idiomatic or otherwise
preferable. My point is the more general one, that we should decide
(in all of these cases) which approach is going to work better for us
and apply that consistently, now that we have the benefit of having
written a couple of device models so we can see what each path looks like.

These initial devices are going to be the models that other people
(perhaps less familiar with Rust) are going to use as patterns when
they write other device models. Converging on a consistent structure
and way of writing devices now will help those future device authors
(including me!), I think.

-- PMM

