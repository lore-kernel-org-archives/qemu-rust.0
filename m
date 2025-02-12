Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiChh-0006kP-RA
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 08:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiChg-0006jg-7H
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 08:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiChe-0004Tl-Ll
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 08:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739366570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hD0PIw+pIDLYif4bwIHxBBXG+3VnK1FzOueEi0RI/S4=;
 b=Ok/zXtHZXqrdVWRi76NdrKEuVZc9xDVEkpKmPa2BhqItVFZaooqELHXWYFWQRCuZSlfKdS
 bR4X/T8Eqpej3Gc9c69HsOE8Hng3oYvgk9ckg+thVCFxXfmCiirocnJter9vsnRtUSCwIQ
 xG2IEtqlFuJzfxrEYmYG+Vuq8Rubbz0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-aCJkm1zPPWWgvYYrhInVWw-1; Wed, 12 Feb 2025 08:22:46 -0500
X-MC-Unique: aCJkm1zPPWWgvYYrhInVWw-1
X-Mimecast-MFC-AGG-ID: aCJkm1zPPWWgvYYrhInVWw_1739366565
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38ddee833e0so467197f8f.1
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 05:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739366565; x=1739971365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hD0PIw+pIDLYif4bwIHxBBXG+3VnK1FzOueEi0RI/S4=;
 b=mBtpV+qN6dYm1pguXm2Nx79wonnZEUWbXhUzOfyRbrH6ABK3K7HsSW1UKQ1SoN7tfL
 5MWXP67QrbIeSep/S1W7r6w4/CnuMXSpsYJW+D4X6fkBzlNZwuE2SiVE4a+ddKafCKep
 p5RI6ujQq2IJH8kLZzzmI94gRCDQC1D5Yv8j/aCvnH4r9nFQjudS02N6C/EjUyzpIfjV
 GEnKxn57N4b1Y+5+1QEkVp22vDuZcXLhDOF8a7vyDnx5ufdWwx92jE0HDjrlCCzTX/Yz
 il169C6LRr2kIrCia0pIYnHauYmJrQAKwslNAxabHCd9VkIfoHW91zCgvLdUSXHj1FMd
 9AgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYFuDjzvHLM4FIHrbKmyvJuchoojkli5BGrzPky6ANP2uEjfk7ol1saeb6tTYLfxl2JCwC6krlmes=@nongnu.org
X-Gm-Message-State: AOJu0YwzU25pZd2d0qmBEstMGW2Awjb5VQzS6WWTx2sfvmB/g0lSlGsq
 uCbWgwU6y/RaAS6yO++HRLp3vunm8+G9FcqQBSGT5YM8gmtVn96Kdn4zGCL/G5vzdwnW9aqTrhs
 RcGifl+TZKpx0VxIEm1+340cTPjmyQfG+1IcH6cjYWHc2GnleGQfmwQ0X9D2Q+cOuLyPjJg4Anj
 sK4h5Jr9tDojVf6OeBMrHuz7+yhQ==
X-Gm-Gg: ASbGncuvMC62xwH+ywqYbBm1pzNDxvgKKYmuQ/xzHBMicZSssSdg4nx9YF/HrCO/Rjq
 C/fBlXcVbEHVEreEJ3aswLQZuORGPmy8do4CelcIamj7HcYRw5S2DX/7icGV4
X-Received: by 2002:a5d:64ef:0:b0:38d:d8f7:8f75 with SMTP id
 ffacd0b85a97d-38de43c6f4amr6811634f8f.17.1739366565300; 
 Wed, 12 Feb 2025 05:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkAf9UQJHlZrKcO1H0w+Ra71HiOHpqfNaKXbmnBrTvt+q3oV0jUlpdNZ96f1s5dBXfBd1Tmz2NLMCTVz0SuLE=
X-Received: by 2002:a5d:64ef:0:b0:38d:d8f7:8f75 with SMTP id
 ffacd0b85a97d-38de43c6f4amr6811613f8f.17.1739366564762; Wed, 12 Feb 2025
 05:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-5-kwolf@redhat.com>
 <533ac9c1-7486-4b1b-af9a-ed4a864727de@redhat.com>
 <Z6yYRrp4KTjveCHg@redhat.com>
In-Reply-To: <Z6yYRrp4KTjveCHg@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Feb 2025 14:22:32 +0100
X-Gm-Features: AWEUYZna8ygT0fcd9g8mri6IVx4pZTckcjFG8Qvehk6e30-DrtjovO8cN5ms0Lg
Message-ID: <CABgObfZ=YjFSkfH9gDWbjeWjkVo6oYgYMdEsZPyaXzeXY=qLtw@mail.gmail.com>
Subject: Re: [PATCH 04/11] rust/qemu-api: Add wrappers to run futures in QEMU
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, manos.pitsidianakis@linaro.org, 
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K-6eT_mNzQfhdpE8lUVWoxOd36MbrfEoSNAWoXt62xc_1739366565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 Feb 2025 13:23:00 -0000

On Wed, Feb 12, 2025 at 1:47=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
> > > +pub fn qemu_co_run_future<F: Future>(future: F) -> F::Output {
> > > +    let waker =3D Arc::new(RunFutureWaker {
> > > +        co: unsafe { bindings::qemu_coroutine_self() },
> > > +    })
> > > +    .into();
> >
> > into what? :)  Maybe you can add the type to the "let" for clarity.
>
> Into Waker. Do we have any idea yet how explicit we want to be with type
> annotations that aren't strictly necessary? I didn't think of making it
> explicit here because the only thing that is done with it is building a
> Context from it, so it seemed obvious enough.
>
> If you think that being explicit is better, then Waker::from() might
> be better than adding a type name to let and keeping .into().

I think this case threw me off because From<Arc<W: Wake>> is a bit
more generic than your
usual From implementation.  Maybe it's obvious to anyone who has used
futures in Rust
(I haven't).

I agree, something like

    let waker =3D Waker::from(waker);
    let mut cx =3D Context::from_waker(&waker);

could be the best of both worlds.

> > Also, would qemu_co_run_future() and qemu_run_future() become methods o=
n an
> > Executor later?  Maybe it make sense to have already something like
> >
> > pub trait QemuExecutor {
> >     fn run_until<F: Future>(future: F) -> F::Output;
> > }
> >
> > pub struct Executor;
> > pub struct CoExecutor;
> >
> > and pass an executor to Rust functions (&Executor for no_coroutine_fn,
> > &CoExecutor for coroutine_fn, &dyn QemuExecutor for mixed).  Or would t=
hat
> > be premature in your opinion?
>
> If we could get bindgen to actually do that for the C interface, then
> this could be interesting, though for most functions it also would
> remain unused boilerplate. If we have to get the executor manually on
> the Rust side for each function, that's probably the same function that
> will want to execute the future - in which case it just can directly
> call the correct function.

The idea was that you don't call the correct function but the *only*
function :) i.e. exec.run_until(), and it will do the right thing for
coroutine vs. no coroutine.

But yeah, there would be boilerplate to pass it all the way down so
maybe it is not a great idea. I liked the concept that you just
*couldn't* get _co_ wrong... but perhaps it is not necessary once more
of "BlockDriver::open"
is lifted into bdrv_open<D: BlockDriver>.

Paolo

> The long term idea should be anyway that C coroutines disappear from the
> path and we integrate an executor into the QEMU main loop. But as long
> as the block layer core is written in C and uses coroutines and we want
> Rust futures to be able to call into coroutine_fns, that's still a long
> way to go.


