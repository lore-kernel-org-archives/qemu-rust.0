Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCDrd-0001iy-6E
	for mharc-qemu-rust@gnu.org; Tue, 06 May 2025 04:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uCDrY-0001iC-99
 for qemu-rust@nongnu.org; Tue, 06 May 2025 04:41:16 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uCDrV-000651-V4
 for qemu-rust@nongnu.org; Tue, 06 May 2025 04:41:16 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1bdb7bso8136039a12.0
 for <qemu-rust@nongnu.org>; Tue, 06 May 2025 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746520871; x=1747125671; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/0cjWunnrGrhtWlE6dY566h4QS4Hb4N2QIVLHUo47Y=;
 b=BYr2a/uhUs4PT57U/EB/EzobHLTi4bhLAYX6/Fc+71j3xaWm7eU7kaV1kr9TqTdH0R
 9SzlGmU/CeLGFWpDyJmU8P3K3tPE0e5GOplifk4WbiSI1LQKpy6eR0sOl2GWyffdvvj2
 HD2WjORv6Su7UGhwcDDh8L0lLCSJ5NaEqsFwfvrXNXckFvz7tsC1aVqxFSe/NWoS9g2j
 3eM5G2L5Qc1Q0TEMlqCHhBUP0XeoyVgpF4RRZR7m2LwteMzLCDBy+SdX951apPRtrhW/
 hyY+q5WDuSwdpJHOwEo9KSFmkcCKnN2uwpFZYq/KlbE9UfL2uWs+ijGXJ+WYrEHQZDZT
 1CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746520871; x=1747125671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/0cjWunnrGrhtWlE6dY566h4QS4Hb4N2QIVLHUo47Y=;
 b=EbJSQVVVmikc4r4W83qdsbNJ/bSM4pFH/2lywdi/koEE3ta9RNeyJHVLn0i3w/28iD
 PGF5H7PGd2fJFzxbwSfsM9lj4dg8kjKV082QjMt6QCOYr6QaoCSW63RWxTYAG7BT8n3P
 lh8YJfVsL5d6k6e3SLo6z3gzcrzjYYX+Ok6UMeH4tEZ6j55B43F1sX7mEBXDAB/n08Q3
 ojijzUJcx5kMqV2vKYSvjRb6rRjDKgVdAdzdz0KnM1bOAZoC5KJs458DvIESBGCLvnyW
 I/YfhLewQN5tMUFVsEMEvKb24GvDjL2KK1XDG10E5jNS2fpWfER7sQcbqheLpLGiZEwc
 Cyhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBYqW4pFQxTzb/LwHmBRdClWHCn0As8kfqIomvcQTFoRwVqU3/bcypNDOIgCiqZZuBC1WSjEUMKbo=@nongnu.org
X-Gm-Message-State: AOJu0YyekR83+sBxMj3FLsGJGygzgzaYDTVfg3sf4z1SPgfLr/Lwl2xW
 zbKt8j1CSCDnx6CvTNwE61NdPeDuIxvQ+1LE4VSsBbJsyU0qv8iDf3Rv96u6j8QngDRdtUR2hCe
 Im7TqlzOwgsfyt3eFElcpqv0/6ua5mWxi5E6kgA==
X-Gm-Gg: ASbGncvokgX5j0B33hx5jijOIG4yd4ZR9AL2mTCPu0DQW4hmTRlnHu9RgLfGcaXAMoO
 WXuVfqYyaEvf6CTULHhhOdrEH993Pdu4ArV78rF0VTO1vwedRGxEarlVvm11dk/rkjlCxMQqBWB
 N8RgT1pe8SRt1xM8vJePj3rTJB
X-Google-Smtp-Source: AGHT+IHs7ForXW1FBanjKlpJdX8Vlr8GQR7Cym32B5dhkzgbrzYP5EgfbEoPTcORqLMfDsUq1JJEra9Ql3HSwr5casE=
X-Received: by 2002:a05:6402:3581:b0:5ee:486:9d4a with SMTP id
 4fb4d7f45d1cf-5fb70d52f80mr1970716a12.33.1746520871358; Tue, 06 May 2025
 01:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <d3d1944e-2482-4aa7-b621-596246a08107@gnu.org>
 <CAAjaMXZhq_uv-w_9TT3++HAcO7r_OhriJA0RKWs8YqY_ryjK4w@mail.gmail.com>
 <7101782c-f642-41e6-8f3a-7061ca722c99@gnu.org>
In-Reply-To: <7101782c-f642-41e6-8f3a-7061ca722c99@gnu.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 6 May 2025 11:40:45 +0300
X-Gm-Features: ATxdqUHe3krC8YsQKLDnKhz9DHVmCbYu-CfX_huZ_XOgicSVG0CgqCrK82tszCk
Message-ID: <CAAjaMXbLUG1jsDZVcwKQV5+UfaCZUWTi4o5KFNJRowLbQ67yqQ@mail.gmail.com>
Subject: Re: Rust in QEMU update, April 2025
To: Paolo Bonzini <bonzini@gnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Tue, 06 May 2025 08:41:16 -0000

On Mon, May 5, 2025 at 4:45=E2=80=AFPM Paolo Bonzini <bonzini@gnu.org> wrot=
e:
>
> On 5/5/25 14:26, Manos Pitsidianakis wrote:
> >>     Something I do notice is that there's some inconsistency in
> >>     how we've structured things between the two devices, e.g.:
> >>
> >>     * the pl011 main source file is device.rs, but the hpet one
> >>       is hpet.rs
> >>
> >>     * some places we use the actual names of bits in registers
> >>       (eg Interrupt's OE, BE, etc consts), and some places we
> >>       seem to have renamed them (e.g. pl011 Flags has clear_to_send
> >>       not CTS, etc)
> >>
> >>     * pl011 has defined named fields for its registers, but hpet does
> >>       things like::
> >>
> >>          self.config.get() & (1 << HPET_CFG_LEG_RT_SHIFT) !=3D 0
> >>
> >>     * pl011 has a split between PL011State and PL011Registers,
> >>       but HPET does not. As I mentioned in an email thread a
> >>       little while back, I feel like the State/Registers split
> >>       is something we should either make a more clear deliberate
> >>       formalised separation that's part of how we recommend
> >>       device models should be designed
> >>
> >>     [...]
> >>
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
>
> >    That said, it's not important, we can choose either convention. I
> > like the less redundancy and separation of concerns: if pl011 gets
> > converted into a module in a future refactor, it could keep its
> > functionality split into different submodules and `pl011.rs` or
> > `pl011/mod.rs` would be the device module.
>
> I think it's okay to decide that Rust devices will have mini
> directories: it's just the style of the language and Cargo more or less
> relies on having lib.rs.
>
> In a vacuum I would prefer to have hw/char/pl011.rs for what is now
> rust/hw/char/pl011/lib.rs, and place the other files in hw/char/pl011;
> IIRC rustc accepts that style.  However we still rely on Cargo for some
> things(*), and as long as we do there's not much we can do about it.
>
>      (*) notably "cargo fmt".  Everything else is more or less handled
>          by Meson starting with 1.8.0.
>
> > - Using typed registers instead of constants: yes coming from C I can
> > understand it can feel unfamiliar. I specifically wanted to make the
> > register fields typed to avoid making the implementation a "C port",
> > and I think it's worthwhile to use the type system as much as
> > possible.
>
> Peter's comments (especially the second and third) were about two kinds
> of inconsistencies:
>
> 1) HPET not using bilge.  This was because Zhao looked at HPET from the
> opposite direction compared to what you did on pl011, namely avoiding
> unsafe and modeling the BQL properly, and sacrificed a bit the usage of
> idiomatic code like what bilge provides.
>
> I think that you made the right choice for the first device and he made
> the right choice for the second device.  But now someone should look at
> HPET and do the work that you did to adopt bilge.
>
> 2) The choice between bilge on one side, and bitflags or integers on the
> other.  For pl011 you kept interrupt bits as integers for example, and
> this is related to the topic of (non-)availability of const in traits...

Oh right.

>
> >    A straight C port would result into integer constants with integer
> > typed fields everywhere for registers/flags.
> >    Yes, From/Into aren't const, at least yet, but it's not really a
> > hotpath performance wise. I think non-dynamically dispatched trait
> > methods can be inlined by annotating the `fn from(..)` impl with a
> > `#[inline(always)]` hint but I haven't confirmed this, just
> > speculation.
>
> It's not about hot paths, it's more that 1) you cannot use From/Into in
> a "static"'s initializer 2) bilge relies a lot on non-const methods in
> its internal implementation, which makes it quite messy to use it in
> some places.  See for example this thing for which I take all the blame:

Yeah it's not nice that we can't use it in static/const initializers.

>
>      impl Data {
>          // bilge is not very const-friendly, unfortunately
>          pub const BREAK: Self =3D Self { value: 1 << 10 };
>      }
>
> and the same would be true of interrupt constants and the IRQMASK array.
>
> The separate bilge and bitflags worlds are what bothers me the most in
> the experimental devices.  I can see why they would be very confusing
> for someone who's not had much experience with Rust, and therefore
> doesn't know *why* they are separate.
>
> >    Again, no strong opinions here. I like the "everything is typed"
> > approach and I think it's worth it to explore it because it allows us
> > to "make invalid/illegal states unrepresentable" as one sage article
> > goes.
>
> I agree, and it's why I think you made the right choice using it for
> pl011.  With all the unsafe code that you had to use, strong-typing at
> least showed *something* that Rust could provide compared to C(*).  And
> I like the strong typing too, even if I'm not sure I like bilge's
> *implementation* that much anymore.

It has its pros and cons that's for sure... there are many crates that
let you define typed bitfields, I haven't looked into the current
state of the art lately. We should definitely move on to something
better if it exists now or in the future.

> I'm not really up for rewriting it, but then I've also done more stupid
> rewrites in the past. :)
>
>     (*) when we were discussing safety vs. unsafety last summer, I may
>         have sounded dismissive of this kind of benefit.  My point at the
>         time was that unsafe code was so much more complex than C, that
>         the benefit of strong-typing wasn't enough to *offset* the
>         complexity of unsafe code.  But it is absolutely present.
>
> >> Related to this I have found recently the `attrs crate
> >> <https://docs.rs/attrs/>`__, which provides an easy way to parse the
> >> contents of attributes in a procedural macro.
> >
> > I actually have some WIP patches for this I put a pause on and can
> > continue e.g. https://gitlab.com/epilys/rust-for-qemu/-/commit/c2c97caa=
af03273fabc14aee5a4d1499668ddbe3
>
> The repository is private, but I look forward to seeing it!  If you want
> to post an RFC without even any code, just to show what the device code
> looks like, that would be helpful as it will catch stuff like lack of
> type safety.

Oops, I forgot I had archived it because I moved development to
https://gitlab.com/epilys/qemu . I made it public again. Bear in mind
this was a WIP, basically my git stash but committed.

>
> BTW, if you need it to model reflection better I think it is acceptable
> to assume const_refs_to_static is present.
>
> Paolo

