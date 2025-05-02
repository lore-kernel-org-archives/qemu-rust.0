Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqG5-0003o7-Pq
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAq5E-0007TD-HY
 for qemu-rust@nongnu.org; Fri, 02 May 2025 09:05:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAq5A-00047N-NR
 for qemu-rust@nongnu.org; Fri, 02 May 2025 09:05:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso374530966b.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746191134; x=1746795934; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpeubmXOH9YAEzoaHh+bQKvZl7yXSx9UCWkBzUJPnPo=;
 b=vw+w4V4AITYaVkotX9ua5Z/2dyJW/RDaAkMdibR5UEqlDA2vR//cjQOT1/u4LB2jlq
 16dXDXsE1mB+KQBMGVyxhEo3ox45zpZd0bE8r/L15lsorB6JXllNN94s+sg9dAUFX7Si
 ZQ/gw7aai2E8+CzgBpxUSpTQ7klWcStRURSLEX1vT733PNF/ddPDw+tV4kBR1qWFHAWa
 fYzHDrSccGEnWnEM0ljNxhCIWPIrBKo0hd8r4BJyJTGyyK4VL941PXozqCL3dN8wZMPT
 bIw2zHJOsblDahA3xtFOAa2bIijGQxobI5HKk8k2FufPOc4z/biqq+p3nvdfgLAgIpX8
 D1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746191134; x=1746795934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpeubmXOH9YAEzoaHh+bQKvZl7yXSx9UCWkBzUJPnPo=;
 b=Azvr3Ltz7ptBD/pqLrVRceVojmDh/lKEZG/As/1UfEnaJZEhQBtZ3h0LI1u7EYYn1f
 6Z1NW7OT8MPqXUG4vEE99IKhVBxTa1qF5b8KLWPTbJnZBS5hUcfzXoWH/E/HrMwcVh45
 RUinLpbCe9uFA0BNcMFVKTU0GZTJB4f0oedwjeDvyy7WANf6s35gtNUAZ7V4mZXTe5sV
 IxQ6DYxO+D04P6rrOikxWBUBOlUG8Sk+pVx8ebAH5Wv2I9yV4gA3VCEKztgaW2lh2W3g
 8qlARNstH8CIedZr1PrxKqYA8RWnRpLv3wDqokvryQvfyW4l/muJxapK6pXGp59F7kki
 i2Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtWhilZsQfqQqOl708S7fJt78YPPoRPBfVSoJ7IQDrW3m3zzpvh8N1QzGB17z3kFYGgeI0LLBCh48=@nongnu.org
X-Gm-Message-State: AOJu0YwxzZ09j/VneWiLiLuA30UdBdG1JjEBCfsi7TNpYqPL00DrknGL
 VhR6Y6jo7Zrtt4YurVmH+/W6hq2ac7senkqlLOcDsicp887ySYVns6NZpr4zOu39NGQ1RM0wrW2
 PxfhdsVTp2MNxGAxgrQsiGBuAWOG7e5BjwlPX7n0NDThZ4jDp3DZVPg==
X-Gm-Gg: ASbGncvOifI4p8e6jfcKVNY6bNcYovLwYX/wtIMIYol169nj9848BUhrBiq8jvbiYy1
 Qf8MdlwQSkoQAAwhbwD9vtMInTwlw51fCiZIxZh4OZeFMPm0LRs3yLsNbQaBynF85tPB7qF0OkR
 zF5caysRq7Fz5q7biTTmE=
X-Google-Smtp-Source: AGHT+IHQzIg+TUOl9yRWbX67CQQJrR7ArRMZZo1NfSt+jmD3emgNGdYYEC6bIyFpNW6bTxTlA71JL+YNgJvWmtWESUE=
X-Received: by 2002:a17:907:961f:b0:ace:d68c:2f88 with SMTP id
 a640c23a62f3a-ad17b5ac57dmr306986166b.20.1746191134292; Fri, 02 May 2025
 06:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-6-pbonzini@redhat.com>
 <svms9i.274a4or3m08g3@linaro.org>
 <efc7ef30-002f-4fe7-84dd-1daeedbafaa5@redhat.com>
In-Reply-To: <efc7ef30-002f-4fe7-84dd-1daeedbafaa5@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 2 May 2025 16:05:08 +0300
X-Gm-Features: ATxdqUHgegE00rsA3wYD-WqgC1XESBHRVEluC0vprGLXvq6T42TKMsVcpzoticc
Message-ID: <CAAjaMXb-28SOS7GyJTV6qRjRVramDHMN7JW-jzB-8Nu97GR4ng@mail.gmail.com>
Subject: Re: [PATCH 5/9] rust: use MaybeUninit::zeroed() in const context
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 May 2025 09:16:24 -0400
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
X-List-Received-Date: Fri, 02 May 2025 13:05:40 -0000

On Fri, May 2, 2025 at 3:23=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> On 5/2/25 13:01, Manos Pitsidianakis wrote:
> > On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >> docs/devel/rust.rst              |   4 --
> >> rust/hw/timer/hpet/src/fw_cfg.rs |   6 +-
> >> rust/qemu-api/src/zeroable.rs    | 104 +++++--------------------------
> >> 3 files changed, 18 insertions(+), 96 deletions(-)
> >
> > Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >
> > BTW There's this TODO in qom.rs, ObjectImpl trait
> >
> >>    /// `&mut T`.  TODO: add a bound of
> >>    //[`Zeroable`](crate::zeroable::Zeroable)
> >>    /// to T; this is more easily done once Zeroable does not require a=
 manual
> >>    /// implementation (Rust 1.75.0).
> >>    const CLASS_INIT: fn(&mut Self::Class);
>
> Yes, good point.  When I wrote the TODO, my idea here was to have some
> kind of
>
>         #[derive(Zeroable)]
>
> macro so that the compiler can "confirm" the safety of implementing
> Zeroable by hand.
>
> However, most of the time the class will be just a C-defined class
> (DeviceClass or SysBusDeviceClass), and then it's not even possible to
> add the derive attribute to the declaration.

Yes this makes sense. A benefit of having `#[derive(Zeroable)]` is
avoiding blanket unsafe impls of the trait, since the derive macro
would work only if all fields implement Zeroable (so in a sense, it's
safe as long as the individual field type impls are safe,
transitively). And we can still do manual unsafe impls for everything
from the FFI boundary.

>  So adding the bound to
> ObjectType::Class is feasible now that one can just add
>
>      unsafe impl Zeroable for bindings::ObjectClass {}
>      unsafe impl Zeroable for bindings::DeviceClass {}
>      unsafe impl Zeroable for bindings::SysBusDeviceClass {}
>      unsafe impl Zeroable for bindings::ResettableClass {}
>
> etc.; in fact it was already possible when Zhao added the impl_zeroed!
> macro in commit aaf3778baaa ("rust/zeroable: Implement Zeroable with
> const_zero macro", 2025-01-28).
>
> Paolo
>

