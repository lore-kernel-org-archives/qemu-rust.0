Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tcTR4-0003oX-NZ
	for mharc-qemu-rust@gnu.org; Mon, 27 Jan 2025 13:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tcTR2-0003n4-IX
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 13:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tcTR1-00015i-3H
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 13:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738000925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bhpu9MchmNdHUpPQcmJVMSueXNvXyJXq3iNa/M1CVyc=;
 b=h+/aCqFs0SSdT7nLaPL0DylrF6nIGnauLmkQhXqv7eHQwdkjgTg81dCzQpG/ax/qRdFe5b
 +sMrHANf7wKR468ZgyLRb87k7wZcqSVwfHvzGbWnIwUkFwzDQCU8AgZeM/IouzU803JJYS
 SUEGrr2vdFQGiiWe5JSWzPbVyyaUnec=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-8Ue1Nd0oOBmglUnbgU_P_A-1; Mon, 27 Jan 2025 13:02:03 -0500
X-MC-Unique: 8Ue1Nd0oOBmglUnbgU_P_A-1
X-Mimecast-MFC-AGG-ID: 8Ue1Nd0oOBmglUnbgU_P_A
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38c24ac3706so3897368f8f.0
 for <qemu-rust@nongnu.org>; Mon, 27 Jan 2025 10:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738000921; x=1738605721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bhpu9MchmNdHUpPQcmJVMSueXNvXyJXq3iNa/M1CVyc=;
 b=EQWcFeG2qWwIkJwinVLWVBoRlipRdIKl+oWmWncvH5biU1zE1QmeSJlUaIhsTZ5IK9
 RNBtHVPvIzgGqOwTPJJCwjjyTcpPiwZADUjQLlBclSgBUp7ChFwDzbv6Tazv5vQi1PIE
 EDv/23EEfuGW7pfFp21amzTCgpHOPwOktjML1OP9gME6L5vpH5wc4mMprEg0Dp5dVB5W
 fEXF/pWZFKeDbpfnGIentnIPcxyrCMq6g47nOHipjLD4nh2WM5elJe00prXKaQkzrxR7
 JH56+LUjsfe2MXRoB6e8xR5DZC7dDFbwTGgHsfsTSPU5GzdUvDA7qnLIZjLTdkzkob6f
 LNcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZYOLo6MZpNKPhxzClSoWWHOjmZaroRO6tz77oMUqvc1PAC2iXt+DJ18edKSGT2eD0sLABlXiysWA=@nongnu.org
X-Gm-Message-State: AOJu0Yw7EruhFfVYCAtGMY6N7A36AkiPeoF6N6WSONpBfwQZiB0ITXth
 liaLQRi73tQjBw9RMCV/m27Y0Qxu7WOwuDPd8Urh1kniVsXNBNlHJTiwFpPmKEKRm4pIqAScY5j
 6BkOPkqYuCVi04IlpPPkxP4Rip7DBKdsqNdykknFgi/iETvbdL3U6Dnxm9GrMEktWZHzwXVLn0t
 ToKBbtifg1N1k5rXuAgWzWG8V5w1VlFhl71DLT0og=
X-Gm-Gg: ASbGncvsepYHMCNgedfuo03iUq4BPNNeXd5OUhYg03HHjkyX2mi9r0yPVk7uGmNqs4P
 Fam+KM0uuQnMZe4ZfKTiv7N63dGbzBfIYcPi06qIJqphACMb3IFfso0Oeypi8ww==
X-Received: by 2002:adf:ab11:0:b0:38a:4b8a:e477 with SMTP id
 ffacd0b85a97d-38bf579259bmr26493764f8f.22.1738000921426; 
 Mon, 27 Jan 2025 10:02:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkOV+tC24FCp1D7NxFscj0H8TuVNXXO+42jCviW1GTHkLlpQg6CM1IE22RJeFIG9iSHYvi1DegMMEmcE00GFQ=
X-Received: by 2002:adf:ab11:0:b0:38a:4b8a:e477 with SMTP id
 ffacd0b85a97d-38bf579259bmr26493708f8f.22.1738000920683; Mon, 27 Jan 2025
 10:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-9-pbonzini@redhat.com>
 <Z5dgn5MQNGEa5lry@intel.com>
In-Reply-To: <Z5dgn5MQNGEa5lry@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 27 Jan 2025 19:01:49 +0100
X-Gm-Features: AWEUYZmql0qa-1YKNBOtXnM4JApCCPsUM4pjW2tMt4xiKi87W6B9k-m9lEteIvg
Message-ID: <CABgObfY1LqB=9KOH0NOxdu+2gF4K+Xg9JqHWLfS9jpnN6Hp6wQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] rust: qdev: switch from legacy reset to Resettable
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JHs4WoogPt01_y7OWze82Kjg6PZHOZ0VHdi72-GJnRc_1738000922
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jan 2025 18:02:09 -0000

On Mon, Jan 27, 2025 at 11:12=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
> > +    /// If not None, this is called when the object for entry into res=
et, once
> > +    /// every object in the system which is being reset has had its
> > +    /// @phases.enter method called. At this point devices can do acti=
ons
>
> Maybe s/@phases.enter/ResettablePhasesImpl::ENTER/?

Yes.

> This constraint requires each device to explicitly implement ResettablePh=
asesImpl,
> even the device doesn't want to do anything for reset.

Yes, that's true but it's just a line of code. Almost all devices
*will* want to do
something with reset.

> So what about the following changes:
>  * Define 3-Phases methods in DeviceImpl.
>  * Implement ResettablePhasesImpl for all devices by passing their 3-Phas=
es
>    methods to ResettablePhasesImpl's.
>
> +impl<T> ResettablePhasesImpl for T
> +where T: DeviceImpl
> +{
> +    const ENTER: Option<fn(&Self, ResetType)> =3D T::RESET_ENTER;
> +    const HOLD: Option<fn(&Self, ResetType)> =3D T::RESET_HOLD;
> +    const EXIT: Option<fn(&Self, ResetType)> =3D T::RESET_EXIT;
>  }
>
>  /// # Safety
>
> ---
>
> Then device doesn't need to implement this reset trait if unnecessary.
> Though this way add duplicate methods, it reduces the burden on the
> device developer.

For now I prefer to make things homogeneous... this way if someone has
to copy the code into a wrapper for a new interface they don't have to
wonder about small differences.

(This by the way will also be a reason to use function pointers for
character devices as well, instead of the trait approach that I used
in https://lists.nongnu.org/archive/html/qemu-rust/2024-12/msg00006.html).

Paolo


