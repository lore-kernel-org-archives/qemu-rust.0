Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfwTt-0006YN-Pk
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 02:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfwTq-0006XV-Pk
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 02:39:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfwTo-0003Un-OA
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 02:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738827556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fW6d0rh/sab5Rc+h/l9LV8v3OQfoX6KJtj86yo6bDSk=;
 b=J7wd5zu0k0jMhJPjhquw37056AW97Flo9OiufSIFz39yUAhVJHq3IcEuH7EqkY3JfSeLJE
 FrhD4AJ7POv1xMF0MRxjRp3dq7YKizCUIqOMA+Q4fDkonzuX3+t2tgdaGVF5wEYDtiZ+6F
 Jw4iqtitiRIz9jo+4pM7v/J2vcrtVGg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-228ZzJJBM0KPkaCD2r1HJw-1; Thu, 06 Feb 2025 02:39:14 -0500
X-MC-Unique: 228ZzJJBM0KPkaCD2r1HJw-1
X-Mimecast-MFC-AGG-ID: 228ZzJJBM0KPkaCD2r1HJw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4359eb032c9so4662085e9.2
 for <qemu-rust@nongnu.org>; Wed, 05 Feb 2025 23:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738827553; x=1739432353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fW6d0rh/sab5Rc+h/l9LV8v3OQfoX6KJtj86yo6bDSk=;
 b=gporBmeH8n7iwJXb8EnhyEDZf2EjDf2UD3fVEGOt6sXMet4FNOLT+WMp9ZCEFYn5/s
 csI41XfKhe3jU9gnifW2cLRrwuF7NeMtyhYJZD9Bg+9kUa51L/WFzel6TC8d0JtUhxh3
 K3NCrVyNVBHzPm/sX7irn3R713+xzV0mqHwXBwm2Ea4slA6X7oj6JQ/YVkyYhVB6dvT7
 p42LPeFr3zTrXCDjDPTfMEtUvV5VJlnisdvzUl41KjSxn3w9QgFz6nfBrs44ei42WfVw
 7OCv7h/6e4RL0lagp791r3lx4YMzAssfGaZfSyDM8ShdXn/0AsUD9ibK8cbgTEL7C4pa
 s5hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOgSN685ybtw5Jeqz3dT4SwHWNL5fZN/n3ZMpIYI7kxAdsByWaKK8iCCJmRKwYQxcFCoTROBoqUiw=@nongnu.org
X-Gm-Message-State: AOJu0Yy/hqaDcIVQn2BF6My1GG2Ki26S17HIoWuXZDlErdRB1WwM/OlK
 767XGu0tgeNODgLDxYYbYX91r2RHMjQNe34Y4eXDpixSYKRA+kNbUUosuGJbEVh7NeVCZv0Pg/q
 wElos/XVrbrbGSXIpa9icx7g0NABgzZe/szD0g7ia6Q8T1/0DZRHy/HNcEj4ned/sevVUkweqmx
 VD1zMuwaWiQnJvPhXqgTSATE7dww==
X-Gm-Gg: ASbGncss5fK/02EgKtuS6t3oqYyFFRsoWWs0OgzlViQWdMShZwPSDZ1+OiMv4bNzRgd
 IuCL3XrBkaSP+MMRwsZ/VH0Cb+gmcR0HzbKbCndnyDowncK4CfIy3Xm69+lJf
X-Received: by 2002:a05:600c:1d26:b0:436:17e4:ad4c with SMTP id
 5b1f17b1804b1-4390d42d923mr42627695e9.6.1738827553215; 
 Wed, 05 Feb 2025 23:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP3M8EphEfRgQSkb2ZRA6uNgr+FM/IHVhGmuPhrJb2iQ4DFZI8AgCnwDy2mQU0BzuXGtyltGgbKzeEaWik35U=
X-Received: by 2002:a05:600c:1d26:b0:436:17e4:ad4c with SMTP id
 5b1f17b1804b1-4390d42d923mr42627565e9.6.1738827552890; Wed, 05 Feb 2025
 23:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-4-pbonzini@redhat.com>
 <Z6RpfkKHEjsQowOW@intel.com>
In-Reply-To: <Z6RpfkKHEjsQowOW@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 6 Feb 2025 08:39:01 +0100
X-Gm-Features: AWEUYZlqeDcJPwic7yFv0zwSgqjyHMywQfp6M2Xze30xAhBwB7YyvTaDeFk2tCY
Message-ID: <CABgObfYLMm-iQuu5u2pDeNSQ=ZR=M5rJVeTu2fO9LZ-fwcXh=w@mail.gmail.com>
Subject: Re: [PATCH 03/10] rust: qom: add object creation functionality
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hMDDJWf2fU8T3lvb99trmZu6xXOopugORUa1ABbYKBo_1738827553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Thu, 06 Feb 2025 07:39:23 -0000

On Thu, Feb 6, 2025 at 8:29=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrote=
:
> The ref count of Owned<> is decreased on exit, so we need to use
> sysbus_realize() instead of sysbus_realize_and_unref() to ensure ref
> count is correct at C side.
>
> Initially, I hesitated here for an entire morning because this didn't
> seem to conform to the usual usage of sysbus_realize_and_unref() (or,
> further, qdev_realize_and_unref()).
>
> But now I realize that qdev_realize() is used for embedded objects,
> while qdev_realize_and_unref() is used for non-embedded cases. Therefore,
> moving forward, perhaps qdev_realize_and_unref() should not exist on the
> Rust side.

Correct, all unref() operations are handled implicitly by the Drop
implementation of Owned<>

> Owned<> will automatically drop and thus automatically unref, while
> Child<> will not unref.

No, Child<> will also unref. The point of Child<> is to prolong the
life of the child object, so that it dies after instance_finalize
instead() of dying during object_property_del_all(). In C that has to
be done manually (as is the case in the clock creation functions), in
Rust it will be enforced by the type system.

> In the future, maybe we need some wrappers on qdev_realize()/sysbus_reali=
ze().

Yep, I'll add a conversion of pl011_create to safe Rust to clarify the
rules around usage of Owned<>.

Paolo


