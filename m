Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tniDu-0005mL-3v
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tniDs-0005ly-Ky
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 13:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tniDq-0005Q4-Ro
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 13:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740679377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3uUuTdaodCLIdelRr2SGz9srjUFLC3yiKG268lxufI=;
 b=MlB0/c3rixjPdkoHhYhHwTWiPx+zHPTLtpVuNfERwACNLryTOtI6i7Vl/IW6J1I2hLgQu+
 2yOJzM88vwk7/xAobrB3MdmQX6PkelhgVvKOhmzMb0YypdTfiVKkhqmFI6xI0ZViTK+kqv
 Txy+nItEZjcXtcddLSG3Qys8PxATdm0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-deaNwg87P3qcHwld69ZjrQ-1; Thu, 27 Feb 2025 13:02:53 -0500
X-MC-Unique: deaNwg87P3qcHwld69ZjrQ-1
X-Mimecast-MFC-AGG-ID: deaNwg87P3qcHwld69ZjrQ_1740679372
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4394040fea1so6958925e9.0
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 10:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740679372; x=1741284172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3uUuTdaodCLIdelRr2SGz9srjUFLC3yiKG268lxufI=;
 b=W3UiPfCIsdUxUK7mKuVQpH1YEiy6xOJWf3YaqLyhLFptQXeF1ydlxuUb5oD5T6fIux
 o+TAU/xlsfoz8yOpoaCHOsBxXShhpRzHXbiJSPRsiYLMo99CrZI3pJnwrgNPupxE6WoY
 RmBZazq0V+E9uz6DktLA0oYl8N/JWAF43ikTI9d8Ia4HJhXOYptiDiwMUa1WMiOX0tUo
 cKWeWXCIK1iWaKn5PfSN1rpv0xDehgeuRDY1y4Tifk70m8SCIAxltvBstSuMqGDpWzvL
 vHv56xhfNt2OANoKMIOzsi1SJStK4830Oepuy1W4sAsW7XP2fSUTUJPlaUNqATBapG+P
 9Uww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6PB1p5ojnAvvmi97mHkyHehhPz2Vx23rn8MFiTlLE9u9kv82xyIGmQbM3k7S25GTHihGo7K+J+S4=@nongnu.org
X-Gm-Message-State: AOJu0YxrKFqrgaM2+tcs5uAInx8YVtPylXLpqz9IcATgUELM2g7RxNTM
 s5fPPwbrfua9cBHyEOOrmfokLq0Y7RoKIzN3YKNrugBXvpbwHuQg2tpFjoC2Z2M6CbJ5G4QSitF
 sU9f0cc81sSdM456n5b3SeeKntOvXtFOMfRH983C0JSSPA6ZvHhDb1V8X/C1/BKyvDPiKYSNuzJ
 BNb+8jYxJgozGTFFXbWFzfP/ftS1vLVkUAN8lTtEU=
X-Gm-Gg: ASbGncv5ZHxsichXkigbo/8xWVUYQViJg+mv8n0MfGywghwy9ArhbEIZ+ZOG8M15yOP
 OKqmdR5D2uM2c9c3PJEixcLpjyJmudPvy2hmBusD96QPAPlRXsTWoS3yrUM03AVohGWTjNIfM
X-Received: by 2002:a05:600c:4fc2:b0:439:873a:1114 with SMTP id
 5b1f17b1804b1-43ba624af40mr3498425e9.6.1740679371511; 
 Thu, 27 Feb 2025 10:02:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiAqth/sxeOAKgHSm/PtyAkzwfR4NCXVAtzhUGMBhoYxN5FFhuGV1Y69BOA/SDnSq8Awyu/A+uX9RhDAg7FCw=
X-Received: by 2002:a05:600c:4fc2:b0:439:873a:1114 with SMTP id
 5b1f17b1804b1-43ba624af40mr3497915e9.6.1740679370973; Thu, 27 Feb 2025
 10:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20250227164538.814576-1-pbonzini@redhat.com>
 <20250227164538.814576-5-pbonzini@redhat.com>
 <CAFEAcA_WOxLvWnp8Tp-Q5xj3_cEs2OGhAbVFtymGwXYKxUePYg@mail.gmail.com>
In-Reply-To: <CAFEAcA_WOxLvWnp8Tp-Q5xj3_cEs2OGhAbVFtymGwXYKxUePYg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Feb 2025 19:02:39 +0100
X-Gm-Features: AQ5f1Jqstke_OnqSaGKiTVzw_sqwLfLWtR947kF4nxmdsWdvg-wSLMj8KxR4wMg
Message-ID: <CABgObfZVxw2BnVYqbsaoy9W+YUgygOaYGpfW=D+7mfmQe8h+OA@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: pl011: switch to safe chardev operation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H-Iwo5CZrnPz00A1415l8DrdfKmSIFccq2rS82NV5BE_1740679372
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Feb 2025 18:03:01 -0000

On Thu, Feb 27, 2025 at 6:25=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
> On Thu, 27 Feb 2025 at 16:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > Switch bindings::CharBackend with chardev::CharBackend.  This removes
> > occurrences of "unsafe" due to FFI and switches the wrappers for receiv=
e,
> > can_receive and event callbacks to the common ones implemented by
> > chardev::CharBackend.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> > @@ -567,21 +552,16 @@ fn write(&self, offset: hwaddr, value: u64, _size=
: u32) {
>
> > -            update_irq =3D self.regs.borrow_mut().write(
> > -                field,
> > -                value as u32,
> > -                addr_of!(self.char_backend) as *mut _,
> > -            );
> > +            update_irq =3D self
> > +                .regs
> > +                .borrow_mut()
> > +                .write(field, value as u32, &self.char_backend);
> >          } else {
> >              eprintln!("write bad offset {offset} value {value}");
> >          }
>
> Entirely unrelated to this patch, but seeing this go past
> reminded me that I had a question I didn't get round to
> asking in the community call the other day. In this
> PL011State::write function, we delegate the job of
> updating the register state to PL011Registers::write,
> which returns a bool to tell us whether to call update().
>
> I guess the underlying design idea here is "the register
> object updates itself and tells the device object what
> kinds of updates to the outside world it needs to do" ?
> But then, why is the irq output something that PL011State
> needs to handle itself whereas the chardev backend is
> something we can pass into PL011Registers ?

Just because the IRQ update is needed in many places and the chardev
backend only in one place.

> In the C version, we just call pl011_update() where we
> need to; we could validly call it unconditionally for any
> write, we're just being (possibly prematurely) efficient
> by avoiding a call when we happen to know that the register
> write didn't touch any of the state that pl011_update()
> cares about. So it feels a bit odd to me that in the Rust
> version this "we happen to know that sometimes it would be
> unnecessary to call the update function" has been kind of
> promoted to being part of an interface between the two
> different types PL011Registers and PL011State.

Yeah, if I was writing from scratch I would probably call update()
unconditionally. If it turns out to be inefficient you could cache the
current value of

        let flags =3D regs.int_level & regs.int_enabled;

in PL011State as a BqlCell.

> Thinking about other devices, presumably for more complex
> devices we might need to pass more than just a single 'bool'
> back from PL011Registers::write. What other kinds of thing
> might we need to do in the FooState function, and (since
> the pl011 code is presumably going to be used as a template
> for those other devices) is it worth having something that
> expresses that better than just a raw 'bool' return ?

Ideally nothing, especially considering that more modern devices have
edge-triggered interrupts like MSIs, instead of level-triggered
interrupts that need qemu_set_irq() calls. But if you have something a
lot more complex than a bool I would pass down the PL011State and do
something like pl011.schedule_update_irq() which updates a BqlCell<>.
The device could then use a bottom half or process them after
"drop(regs)".

HPET has another approach, which is to store a backpointer from
HPETTimer to the HPETState, so that it can do

    self.get_state().irqs[route].pulse();

without passing down anything. The reason for this is that it has
multiple timers on the same routine, and it assigns the timers to
separate HPETTimers. I would not use it for PL011 because all accesses
to the PL011Registers go through the PL011State.

A while ago I checked how OpenVMM does it, and basically it does not
have the PL011State/PL011Registers separation at all: the devices are
automatically wrapped with a Mutex and memory accesses take a &mut.
That removes some of the complexity, but also a lot of flexibility.

Unfortunately, before being able to reason on how to make peace with
the limitations of safe Rust, it was necessary to spend a lot of time
writing API abstractions, otherwise you don't actually experience the
limitations. But that means that the number of lines of code in
qemu_api is not representative of my experience using it. :( I am
sorry this isn't a great answer yet; certainly some aspects of the
PL011 or HPET devices could be treated as a blueprint for future
devices, but which and how to document that is something where I would
like to consult with an actual Rust maven.

Paolo


