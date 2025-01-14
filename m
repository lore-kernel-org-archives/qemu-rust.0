Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tXjZY-00024q-TJ
	for mharc-qemu-rust@gnu.org; Tue, 14 Jan 2025 11:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tXjZU-0001z5-Jj
 for qemu-rust@nongnu.org; Tue, 14 Jan 2025 11:15:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tXjZQ-000448-B4
 for qemu-rust@nongnu.org; Tue, 14 Jan 2025 11:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736871304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cA3KM01mV4/ItjrFH1ZGAv4l9SHuh0Ckd8svHOXhRjU=;
 b=FRBGsKro+r9Upi4HIrqSSWe2sPiU+DzGrfbM1SQ2KxVAC2KQ4MxCJndAXadKndOaDx5IRb
 /QJgHq4ZsoDWETV1B57b6M3P2jppn1NcKc6/1WQ4k50c0px9uaW8CWp6YrhMGUA0jzegwX
 mnPUBUhCL2l0WVtXdrD+vVw3vY4ZdqE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-QV04VhiyPCKPsYMhNysOdw-1; Tue, 14 Jan 2025 11:15:01 -0500
X-MC-Unique: QV04VhiyPCKPsYMhNysOdw-1
X-Mimecast-MFC-AGG-ID: QV04VhiyPCKPsYMhNysOdw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385d51ba2f5so2848755f8f.2
 for <qemu-rust@nongnu.org>; Tue, 14 Jan 2025 08:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736871300; x=1737476100;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cA3KM01mV4/ItjrFH1ZGAv4l9SHuh0Ckd8svHOXhRjU=;
 b=hHXYms+el34Cy9HA71Rru2dwilB5mcyOPBghp/iBaw+0ApHlytnh3eZPVM/C2SWCFo
 Q2NtrbzVRkKTYpCYQ1ADIOSS1l19ff/Mfr4AYnDx4ir1G3OC5cUunsPyM4BV7zIjMQay
 LZwhAixZ/LkgNE95+SeWKrc0aIyPaPk1SPAe334qTglKgxBpxJ7ebQnwHq7Ljby1Jt8k
 4TUOe8vIy5CTQtdEnH/VUuUj587OvO85SRnIaL/ZszZ0zS273W2zI01LPB4a0jrWNWjO
 1Ka47EI4GmI1p7yfkbC3YJBLP+WZfNfL6ye0zk9U8Okq9ADzg9sNqZ48yVbfP66c6+RJ
 y5fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdUW53Mfe77KdONCuFOUcO6WckApf14SBLnftYux1INHhsTH790SRO0GZiY1LDXluvxvGHLH0vn2s=@nongnu.org
X-Gm-Message-State: AOJu0YyGL6QBiUXXHpkav3iXu6rRR07Z/TpJV8R8mi6sL+duemanlQV8
 69agcv5D7OxRFRjtQbSqHPmZrFBNh+kkf3MDvCjIEPzv+fp4hmqOQjQLqOLDCKphMovLwcMRSmF
 ZrURI1sZYAUaxSzZ7qYNCiQvzejDE742w7xsVDTDxRauuuOX5RZeaDkWIjrq+vPmnu9rXgQfF6s
 0VVVS2DRjNv43RAIf3BlyHFUC5BzMYqwVZHP5W
X-Gm-Gg: ASbGncsJcbofh4h6QzIY0uN4/Q1EtpQ6gV+/j42t2cf3V2BZ04ZX/pu5gwKfrBXBGzy
 xlhnsj/lP2CiHvULy+6tygG7lPD4QP7FoAu1e5v8=
X-Received: by 2002:a05:6000:2a3:b0:385:e30a:e0f7 with SMTP id
 ffacd0b85a97d-38a87309cedmr23008660f8f.22.1736871300130; 
 Tue, 14 Jan 2025 08:15:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGHfkrhPYs6NBCl/5zS+wIacAY/vpY0H6zjAxcUfNYXTaNmU2DDVyHRojx3O8iF+WBwhqitv9OzzAKsAf2JAM=
X-Received: by 2002:a05:6000:2a3:b0:385:e30a:e0f7 with SMTP id
 ffacd0b85a97d-38a87309cedmr23008638f8f.22.1736871299806; Tue, 14 Jan 2025
 08:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-8-zhao1.liu@intel.com>
 <9cb123e2-5237-46e7-b6fe-ce8f813cc43c@redhat.com> <Z4aEkLhcGVbXX82O@intel.com>
In-Reply-To: <Z4aEkLhcGVbXX82O@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 14 Jan 2025 17:14:48 +0100
X-Gm-Features: AbW1kvYrjkMhZTsrV2uu6E97nb6WSrdFOfbkSjnsfQJxc8U4ExANOaCu5sCllUk
Message-ID: <CABgObfYRAYPBidb+cUPCrtdAEXGZiSG2hf5CvJskXmTpR1ftpQ@mail.gmail.com>
Subject: Re: [RFC 07/13] rust: add bindings for timer
To: Zhao Liu <zhao1.liu@intel.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c3CJWRYkebrqSLMGDjmhdoGyy_3d1hzZ5ly8JLNHzmY_1736871301
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 14 Jan 2025 16:15:17 -0000

On Tue, Jan 14, 2025 at 4:18=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
> ...Now I have a draft for timer binding:
>
> * timer binding:
>
> impl QEMUTimer {
>     pub fn new() -> Self {
>         Zeroable::ZERO
>     }

Maybe Default too (not sure if you even need new())?

>     pub fn timer_init_full<'a, 'b: 'a, T, F>(

It's better to use longer names like 'timer and 'opaque. But it's also
always possible to pass a longer lifetime, so 'opaque: 'timer is
strictly speaking not needed: you can just use &'timer T which in turn
means that lifetime elision applies. That said, I think I like the
idea of using 'timer and 'opaque lifetimes here, for clarity.

>         &'a mut self,
>         timer_list_group: Option<&mut QEMUTimerListGroup>,

I think QEMUTimerListGroup can (should) be shared because it's thread safe.

>         clk_type: QEMUClockType,
>         scale: u32,
>         attributes: u32,
>         _f: &F,

Better: "_f: &'static F", or even "_f: F" if it works.

>         opaque: &'b T,
>     ) where
>         F: for<'c> FnCall<(&'c T,)> + 'b,

'b ('opaque) is not needed here because the opaque is passed _into_
the function (thus its lifetime is 'c). 'timer would make sense, but
in fact the function itself is always 'static (see FnCall declaration)
so it is unnecessary to add a lifetime to FnCall.

> fn timer_handler(timer_cell: &BqlRefCell<HPETTimer>) {
>     timer_cell.borrow_mut().callback()
> }
>
> impl HPETTimer {
>     ...
>
>     fn init_timer_with_state(&mut self) {
>         let index =3D self.index;
>         let cb =3D |cell: &BqlRefCell<HPETTimer>| {
>             timer_handler(cell);
>         };

Why is the anonymous function needed?  Can you just pass "timer_handler"?

> Is this timer binding as you expected? Hope I am on the right track. :-)

If the only correction is to the function declaration, that's as good
as it can be for Rust! ;)

Thanks,

Paolo


