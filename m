Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnj1Y-0005DK-Mt
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 13:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnj1T-0005BG-Hy
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 13:54:17 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnj1R-0005mg-J7
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 13:54:15 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e60b01d0e1bso424149276.2
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 10:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740682445; x=1741287245; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVmkhnO1xd6/jMeYQxgCgkhwXVcijlfp5dWT6YBhEkg=;
 b=kl+HXetgPbeUgkpbjQrgUR6RyPwznA7osdiE8BUUVfVkwOPeUYKw56vOsPN7kVvPej
 N1mN2dZfmSKAaSjOzsqyK1O6Vaq6fucDSul7nu0+UoN5VNp6FVwXhVsCVPeEFdXtm0XV
 6SEAvhnl6skT7nDhpg6pA3MfVKP1vh0Pg/FeixrTnHy/AFHACGBWa90NXkf4oDAlZrjl
 9N702ait9WIL8HjjZzheTHHr7Z+bX/otBfwYWDdeHgWi7DtvIEtxMZl41zGyF27pzBny
 FO5rBO8s7thI61NoxKIDc2DJyYRcT/muFcbZsJkROYCoLx4mIyF5+rtRCVpuQt9xbDAd
 0hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740682445; x=1741287245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVmkhnO1xd6/jMeYQxgCgkhwXVcijlfp5dWT6YBhEkg=;
 b=XX2i+7FzOlTcWFrK7Ps6lT9Jp2tURJZmuXRGHqvtnsr2+UOFH5FB5to6QYuJOxcaSU
 rr+HW8lQkB66KTNnzSNcKmUwpyPPqFvN8G1omXe1GL4pWOjk6aqlMNDDNV7NF1ji5CkF
 c+x/C9GmcjZRmU0QdT9NxEnYGX3pb0JRGE8FRQtWk9hN5UrGQSn5adDqfmBMSc4CHnrc
 N2LoN+iGlt5YEI/55ohYl+50RK3n+WCzQQ+i92yNLD1ivj8qBuK9fZBJV3WNurpoOFRX
 gvCVpAJHfrykdprDeFN4PLNcn1KBcyGGH3/jlsZvrOIYpUBaFQj1RCBgkuai13xsXW6D
 iMBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYzuB3FtZr4ybuNTgEeGbdJtwdvX4pHeBCVOYTAjBxRseN+/sYMKrXKS1p7uWrQ6oYcobyRGNp7Qs=@nongnu.org
X-Gm-Message-State: AOJu0Yw9WfnHbIvH4wq7apkKgGeYWY/YwpQEbkyOErqw0KkXNNd+pAtq
 j3cxQJkAoFFZ5xs5rw5R45XRznCHGYK9hzCLq9WuNIZXHgyDn7dWp8GVBcNVdonHHCgm8D7KVyP
 5eybsbvSET227rM4D/jvgsd4ZrB5h1k1mz9EVGQ==
X-Gm-Gg: ASbGncvMYjSehrr2s1gJxK+cIexys4aNgHJtHZJffy8tiQDDSMfRm25C6UGD763t4S5
 p5Gm49WSPgdyfVxE5KQ8OeEdxtfZwZsTxF27fjo/dM1L8/NMrUVDVvF273lhxXx6YYC3wMSyyKW
 3WejBF+SD0
X-Google-Smtp-Source: AGHT+IGklIX64S8vsIsMBjghZBaI0X4+Hw6L66/R8AptvHW7tsXn5hN5u8XxMV79JhEvK+Q9wVMaTZ+lJf7KDvLoTlE=
X-Received: by 2002:a05:6902:2412:b0:e60:9961:f832 with SMTP id
 3f1490d57ef6-e60b2ebfaf7mr312725276.23.1740682445107; Thu, 27 Feb 2025
 10:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20250227164538.814576-1-pbonzini@redhat.com>
 <20250227164538.814576-5-pbonzini@redhat.com>
 <CAFEAcA_WOxLvWnp8Tp-Q5xj3_cEs2OGhAbVFtymGwXYKxUePYg@mail.gmail.com>
 <CABgObfZVxw2BnVYqbsaoy9W+YUgygOaYGpfW=D+7mfmQe8h+OA@mail.gmail.com>
In-Reply-To: <CABgObfZVxw2BnVYqbsaoy9W+YUgygOaYGpfW=D+7mfmQe8h+OA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2025 18:53:53 +0000
X-Gm-Features: AQ5f1JrzqRXmi0GsXXdPW3VhSB0N-CTUhfnwNRxFnEd1eFlUi12ZqArOfk2tIyo
Message-ID: <CAFEAcA-CgYt2p6JqzU0ttCwDpfp4bbMWM2SAn8xmSE9BmC6xeA@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: pl011: switch to safe chardev operation
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Thu, 27 Feb 2025 18:54:17 -0000

On Thu, 27 Feb 2025 at 18:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Thu, Feb 27, 2025 at 6:25=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> > Thinking about other devices, presumably for more complex
> > devices we might need to pass more than just a single 'bool'
> > back from PL011Registers::write. What other kinds of thing
> > might we need to do in the FooState function, and (since
> > the pl011 code is presumably going to be used as a template
> > for those other devices) is it worth having something that
> > expresses that better than just a raw 'bool' return ?
>
> Ideally nothing, especially considering that more modern devices have
> edge-triggered interrupts like MSIs, instead of level-triggered
> interrupts that need qemu_set_irq() calls. But if you have something a
> lot more complex than a bool I would pass down the PL011State and do
> something like pl011.schedule_update_irq() which updates a BqlCell<>.
> The device could then use a bottom half or process them after
> "drop(regs)".
>
> HPET has another approach, which is to store a backpointer from
> HPETTimer to the HPETState, so that it can do
>
>     self.get_state().irqs[route].pulse();
>
> without passing down anything. The reason for this is that it has
> multiple timers on the same routine, and it assigns the timers to
> separate HPETTimers. I would not use it for PL011 because all accesses
> to the PL011Registers go through the PL011State.

I think the idea I vaguely have in the back of my mind is that
maybe it's a nice idea to have a coding structure that enforces
"you update your own internal state, and only then do things that
might involve calling out to the outside world, and if there's
something that you need to do with the result of that callout,
there's an easy mechanism for 'this is what I will want to do
next after that' continuations".

The fact that our C device implementations don't do that is
kind of the underlying cause of all the "recursive entry back
into the device via DMA" problems that we squashed with the
big hammer of "just forbid it entirely". It's also in a way
the problem underlying the race condition segfault here:
https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=3DW=
n+k8dQneB_ynQ@mail.gmail.com/T/#u
(memory_region_snapshot_and_clear_dirty() drops the BKL, no
callers expect that, segfaults in the calling code in the
framebuffer device models if something else gets in and
e.g. resizes the framebuffer in the middle of a display update).

So I was sort of wondering if the pl011 structure was aiming
at providing that kind of separation of "internal state" and
"external interactions", such that the compiler would complain
if you tried to do an externally-interacting thing while your
internal state was not consistent.

thanks
-- PMM

