Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCFx0-0001Nj-2y
	for mharc-qemu-rust@gnu.org; Tue, 06 May 2025 06:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCFwy-0001NE-T7
 for qemu-rust@nongnu.org; Tue, 06 May 2025 06:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCFwx-00061X-6X
 for qemu-rust@nongnu.org; Tue, 06 May 2025 06:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746528898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QB6cMM13G9J7ZMV9roqY0baBsycG5Qv2FLuRzK0REw=;
 b=huA2nbhl+t5wqLbJNqXh4SAxVOibbVvPYtNFLgk3pTcj2uBAgDa2ODsVDLIJtjp8W6xUJR
 TFNfIbgdzVTaBY4FLVnypcFrEXkJh8p1iQqfLG/sQ1yQ6+nONmCrtfccpXV+Sm9PUXT0NE
 72/XyX71eLB4LBSq6USTQu4mhpUk7j0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-GLPlLTGoOsGAjTSHUMOrUA-1; Tue, 06 May 2025 06:54:57 -0400
X-MC-Unique: GLPlLTGoOsGAjTSHUMOrUA-1
X-Mimecast-MFC-AGG-ID: GLPlLTGoOsGAjTSHUMOrUA_1746528896
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39ee57e254aso2957404f8f.1
 for <qemu-rust@nongnu.org>; Tue, 06 May 2025 03:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746528894; x=1747133694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QB6cMM13G9J7ZMV9roqY0baBsycG5Qv2FLuRzK0REw=;
 b=GE4YdKy+4/QLMoZnpx/PYi49NFKh3FnCQjnjRoBJf8kVbpL9yoIRW8GvGvLyuQqTRr
 wZKCO06YomLgiboRc1ffuaT8ccYvZzMLlZHgLJQ6Lt/Wo7GuDF/zoWUEqFV6XDL80ycV
 DLFxKx+dHZcTGxsdbAZZKMvNRE6tlFMqHFS+hvKnSKfjVJZekZhytKmcf/DFdYhAEwMy
 E9Sa+VcSstS11Zhz0WgaA3Q+VNcYcwRcBtGtVAg+pVQgeBLCcqZE5tP/CJvXs0v9/vSm
 IXrNA+lvUW7N74UAeMac6mFYNpJbfj+cv4cUSYT803zsWyL0ngWj8/LZyivOuiNYnLcV
 b0oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy831eWRHmsF4mrD6OYPp4FKfxUXu8KhKO0JM10z2UeIK1Vh57Q8MR6OKPZbouC+I3M2GNqNwubVk=@nongnu.org
X-Gm-Message-State: AOJu0YzaGeauEy4oMG1uhFeSQzGx+3D1Uweti8mws/V9ce8aqY9Ij0Qq
 au4jFxZk0N398wkSP/jjw0SHhjmIp9hggceJFdFkZhNH8dtHvYOvTskybiNVN5rXEkT9yqg2DCw
 ZvTEqhMlMoJqylBv7y1U6SElTnKDDPRSZPYJMRvqZvxTxDNbvFCM0tFzPz7Bskolqk8dO1fbOl+
 Ddz0Tip0HZGO+3nIjBJ3q8ns08jNdBqzMXnToV
X-Gm-Gg: ASbGncuK1BQxZFXrXBuYcGFxL8xKwNR8TOhpdGti67uhiDA1WBeiljgvvQgt+8/BI+G
 6PyCigzFFnfFyo1YpsmXQblgJmTZdnYZhdwNzfNa1sBzEwiR2vNo0ukNruH3MQ3JK+C2/
X-Received: by 2002:a05:6000:2505:b0:39e:dbee:f644 with SMTP id
 ffacd0b85a97d-3a0ac1ff7famr2051484f8f.46.1746528893892; 
 Tue, 06 May 2025 03:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNuzhjzZZTuEi2Y/4YMEd7FbdTFytzWENrKypJU2GHjSkPTT8LACBoD6XD4JyKsO/giTU5N3QfPQL1zapgI6c=
X-Received: by 2002:a05:6000:2505:b0:39e:dbee:f644 with SMTP id
 ffacd0b85a97d-3a0ac1ff7famr2051461f8f.46.1746528893565; Tue, 06 May 2025
 03:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250505100854.73936-1-pbonzini@redhat.com>
 <aBnOyhMawDaY9yyR@intel.com>
 <CABgObfYDOAGKdRNO91bfXQ4MPjbc0wNZSrDfpDiQZsOkrL53RQ@mail.gmail.com>
 <aBnVtNgdjQ9DlugK@intel.com> <aBnbC4-hov9gY3MF@redhat.com>
In-Reply-To: <aBnbC4-hov9gY3MF@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 6 May 2025 12:54:38 +0200
X-Gm-Features: ATxdqUHQg1hWwOJqvxHrZULs5Ou4j82aKXsfY_S-ot90L0_AWxP-f9d49P6L46c
Message-ID: <CABgObfbzWDnntjLcshsBPfdEdbx-6iqxd6FxUDbQa--VOqan=A@mail.gmail.com>
Subject: Re: [PATCH preview 0/5] rust: allow minimum version of 1.83
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0S8kViG2FZtlATDYkbaA9NKqmgH3n2RhOJxWMz5qtJ4_1746528896
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 06 May 2025 10:55:01 -0000

On Tue, May 6, 2025 at 11:49=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> > > [...] If Rust is missing or old, "enable
> > > all devices written in Rust" will fail compilation (e.g. Kconfig woul=
d
> > > fail for ARM/x86 targets due to unsatisfiable CONFIG_PL011);
> > > "enable Rust" will simply pick the C version of the PL011 and HPET de=
vices.
>
> I don't really like this because it perpetuates a state where we have
> parallel implementations of devices that have to be kept in sync.

Me neither (see for example the Meson transition which avoided
parallel implementations at all costs).

On the other hand, this series shows that it's hard to have a baseline
version earlier than 1.83.  The bindings got pretty far while
supporting older versions, and the few hacks needed were nice testbeds
for the build system and the procedural macro infrastructure, but the
improvements that const_refs_to_static provides for reflection are
just too big. And for Debian that means waiting until July 2027 before
making Rust mandatory, and for Ubuntu that's April 2028 based on the
current situation. I hope that the effort proves itself either valid
or unviable in less than 2-3 years. :)

Now, it's certainly not the only possibility:

1) If someone contributes devices that are written in Rust then we
could just drop the PL011 and/or HPET sample device. That's a pity but
they would survive in git history and could be resurrected later.

2) Using RUSTC_BOOTSTRAP[1] allows enabling unstable features even in
versions older than 1.83. Disadvantage: build system changes that will
be obsolete soon(ish), plus the relevant compiler code obviously
wasn't as tested as after stabilization. I'd prefer to avoid that, but
hey---Linux does it.

3) Affected distros could use RUSTC_BOOTSTRAP themselves if they want,
while upstream QEMU would only support rustup toolchains for Debian
bookworm and Ubuntu up to 24.10. This only requires
tests/lcitool/refresh changes, the disadvantage is that the project
would renege on the general promise that we make on platform support.

[1] https://rustc-dev-guide.rust-lang.org/building/bootstrapping/what-boots=
trapping-does.html#complications-of-bootstrapping

> If we're re-writing C devices in Rust, we need to be able to promptly
> drop the C impl once the Rust impl is feature complete. Keeping 2 impls
> is a general maint burden, as well as an ongoing vmstate compatibility
> danger if a change in one impl is not matched by an identical change
> in the other impl.

I agree. One more reason why "Let's Rewrite It In Rust" is more of a
necessary evil to bootstrap the creation of bindings, and not a good
idea in general.

> IMHO having Rust declared supported in QEMU should be aligned with being
> able to drop C impls of any ported devices.

I agree in principle, though theory and practice may diverge.

Paolo


