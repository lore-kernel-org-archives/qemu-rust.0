Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKbdY-00089k-MR
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 06:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKbdW-00089O-Mm
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 06:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKbdU-0003Xz-J6
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 06:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733742544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fG+7cBLw3ozNAvpsTGgweEh6wdBj9c1mzql0ZcIoBuY=;
 b=RobQyrexz1cHjrJiXmfMpsp9ANqJ/yAkMxsf+khk8Urrkhei/YyUh979fxmdo6Xk7pmCpp
 f7lpDVLWt9U7rOGsTKoiMMKf7ZEcX5lJYSnflsms934zIGKM2HT+c7+FFH+HlbSq+kx7LR
 3T54r9JOAP4DmVEdidW+t1Lb9+BUoVk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-p1QUn6J-NqyKf_HjeqEnrg-1; Mon, 09 Dec 2024 06:09:03 -0500
X-MC-Unique: p1QUn6J-NqyKf_HjeqEnrg-1
X-Mimecast-MFC-AGG-ID: p1QUn6J-NqyKf_HjeqEnrg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434f3fcc891so8891455e9.1
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 03:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733742542; x=1734347342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fG+7cBLw3ozNAvpsTGgweEh6wdBj9c1mzql0ZcIoBuY=;
 b=Lw8jMajls15Yo+MhGW5jXRHhuKPayAQmfdGxIZh3XrCeDIUMnlj/CAaszXRy6ynACS
 HT5BvT4RZzJ05PwhlUayCxhYt5Jd1YmQEQhkMpg2sAaclaInTJX5kKyt4eKAvU8v8m/x
 gJLongxMEp94/vh19nEz/PRdQHxYKS1yEwHApOFGUOtRQZ6cUw89/q94rdtPtn/5o0x0
 xNWtjDCpM8yfpNwjIDJAvyrev3to7Iwf3l4X4e3rfo0nE7lhHi5WdtZshi5GirAJNWSV
 yS2Idev6OVwhL7GzoDbecPzut+txYjH3mQT4cLnf0y9aVwFeUf58JQ6GB1vA/XhRK5jF
 1xwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWwLSEu+M9EzNwnFa6YJeGKsJELP9y0iG8O19dgQEWQ/Wq7ckFyBipLRMnj2gRzIEvBS0m1xhnuag=@nongnu.org
X-Gm-Message-State: AOJu0YyoqgpazHTPdj9S36FXenuWh0I1zKVPBxZqOTJV1WQUiFNQFEU/
 b0I+kbHZ1lHF9TbLPSvfhf/5QPFeef6DuWWWuokeqggWyf1nY0EODDe2Nm2qi7uFu/nK2OHwQSY
 qr5F3S3lcGeizyDN4MGlYURwaCv5NDIJeizIjc/fPQppag/PeUoT9OKh4hYGKiVRjoQUP6Rt7AD
 zwZh27l0L35jUUCecTDtQPn3c8Cw==
X-Gm-Gg: ASbGnctuARfZCLSL20fF+TPxsVyzmXbk/5IqjhBOxJ+G7CTR6z5ukgBOy1bWBek6hve
 i/xMuhHEfi0ypggyRgm6yO0c1vSgt0hA=
X-Received: by 2002:a05:600c:3589:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-434ff45d12amr4388125e9.18.1733742542595; 
 Mon, 09 Dec 2024 03:09:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQBWdTud92PxotpmlTt/9cqgjEKJAog9u0BuubgyAJM7sfJ59/8ggo6ZuLFfJH/RlvbSOUl5ooCdJWPjozV0Q=
X-Received: by 2002:a05:600c:3589:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-434ff45d12amr4387755e9.18.1733742542240; Mon, 09 Dec 2024
 03:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-5-zhao1.liu@intel.com>
 <6108dfe6-f629-431c-be91-51abff338e85@redhat.com> <Z1XJBJp+l92+OrY9@intel.com>
In-Reply-To: <Z1XJBJp+l92+OrY9@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 9 Dec 2024 12:08:48 +0100
Message-ID: <CABgObfaeoLociD5rzptg4Uj4anMonc0M8iP_TK3qa-17FecR2A@mail.gmail.com>
Subject: Re: [RFC 04/13] rust: add bindings for gpio_{in|out} initialization
To: Zhao Liu <zhao1.liu@intel.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8QAWpzYH3VoYpmFl3Ff8Ju8pOGEJaWwLGnBtcFNhV3Y_1733742543
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 11:09:10 -0000

On Sun, Dec 8, 2024 at 5:09=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrote=
:
> > This has the same issue as timers, in that you could have (especially o=
nce
> > someone adds named GPIOs) multiple handlers.  So we need the same kind =
of
> > Fn-based thing here too.
>
> I will refer to the timer callback prototype you suggested and try that
> way. Will you rework the timer binding soon? (I'm sorry for bringing such
> burden to you).

No, I have written a utility that can be used for all callbacks but
I'll leave it to you to use it for timers. Both because you have
already started the work, and because it helps if one person writes
the code and one uses it.

> Additionally, the current DeviceImpl trait is quite special. Although in
> Rust, DeviceImpl traits are implemented for device states, DeviceImpl is
> actually used for device classes.
>
> Semantically, it might be more natural for DeviceImpl to be a trait for
> device classes. However, parameters of its methods are DeviceState, so
> it makes sense as a trait for states in Rust.
>
> This seems to be a different design before C and Rust Qdev.

I agree that there are differences in how you write the code, due to
the fact that Rust supports associating functions and traits to a
struct, while C only has a global namespace. Also, functions in a
trait can look like both "normal" and static methods, so it's easier
to place all functions in DeviceState. The DeviceClass part is mostly
automatic.

So if Xyz is a struct corresponding to a QOM type, it will:
- include a field of type Abc corresponding to the direct superclass
- implement virtual methods for all superclasses through traits such
as AbcImpl or DefImpl, up to ObjectImpl
- expose its virtual methods to C thorough a blanket implementation of
ClassInitImpl<AbcClass> or ClassInitImpl<DefClass>
- invoke methods through blanket implementations of AbcMethods,
AbcClassMethods etc. for all superclasses

and the structure of all the blanket implementation is always the same:

pub trait DeviceClassMethods: IsA<DeviceState> {...}
impl<T> DeviceClassMethods for T where T: IsA<DeviceState> {}

pub trait DeviceMethods: ObjectDeref
where
    Self::Target: IsA<DeviceState>,
{...}
impl<R: ObjectDeref> DeviceMethods for R where R::Target: IsA<DeviceState> =
{}

impl<T> ClassInitImpl<DeviceClass> for T
where
    T: ClassInitImpl<ObjectClass> + DeviceImpl
{...}

In the future, developers will not need to worry much about these, but
for some time every new device will probably need a few new functions
or even modules in qemu_api.

Paolo


