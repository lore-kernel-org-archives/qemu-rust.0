Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLM3R-0000GM-0f
	for mharc-qemu-rust@gnu.org; Wed, 11 Dec 2024 07:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLM3N-0000E9-Tq
 for qemu-rust@nongnu.org; Wed, 11 Dec 2024 07:42:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLM3J-0000tK-N2
 for qemu-rust@nongnu.org; Wed, 11 Dec 2024 07:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733920972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vq3FrMhMejZKmaw5CP5HgzQ5OYKuGQCtDjPOZpdfK1M=;
 b=WtQ9E2BpIDbWHWEdT6Los3/r5VE2wA57Vq1VsS/oH0FyOiR0ZzNmdOO7PILdMHXyTIMmEo
 1KY4ZEpn6744ltayF6GaQy7CfHDqezNswmqwIg8OizzBQukapikU4RQmH0Tr74zR4lBH4p
 rvjYJQCCPyNeFcBRFrzy9Ydl+aOZy8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-8aUPggsTNc-TqI_TaXEjaw-1; Wed, 11 Dec 2024 07:42:46 -0500
X-MC-Unique: 8aUPggsTNc-TqI_TaXEjaw-1
X-Mimecast-MFC-AGG-ID: 8aUPggsTNc-TqI_TaXEjaw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434fa6d522bso3824045e9.1
 for <qemu-rust@nongnu.org>; Wed, 11 Dec 2024 04:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733920965; x=1734525765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vq3FrMhMejZKmaw5CP5HgzQ5OYKuGQCtDjPOZpdfK1M=;
 b=sZNGYIjjM09pgaWWRIsOWtYfz7YynILmVoM2e5dnM6X6DxYWdO/4ihAxBX3q7CaJRe
 fG6YAwRb1XyXn0xYDF9DKJ8o16IxeSY2U1IMEG7u0I6NdFyo5TgVPYcD5FfLSAbc79j5
 pRi3mr+YrHXe56NzoXhpAF8dQwlEXglFVTtiGKc/V0M8sczWpFagHv6wI1YZYE0HdVb6
 Zl42e2XmOibuRgWi5BNj+Q/5hDQT8u4oZeqAIHMh6BEdjmz/PjsvWaCIp4WXkP/uMMdj
 qlUq0cm/u4o/UkZVMxwuWuR+atfpGsBwuyQJvgrrzAXl2eFhDC72SB51jLI8jnvv1pom
 4LIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg/tZ0prcvYRvCXA984VKNKp1iBlp3/+4S2fxoz+lYPQOW88ivyxStvoeqvUeyeTCvM+hrvhSGGFE=@nongnu.org
X-Gm-Message-State: AOJu0Yykhb5OJuu7TzDfjycBCFfxJA72df/Z4K7X12iulOwVVDCOfVQU
 LXrIyY9NGR+DjDwHXMnclBEsZ/BCTmjBw+5QKnGaOqL4d0r6SFcF/JI6XDmRvKlN45ia/orKmlO
 cwjd4YyXQ4KUOj3XcHYLRbbSpxFMNZX2hV3A4ldzoR+8tiNt0eps6UT/awjixrWQ6uWWDpBWpOI
 p0qiFJyRntfbAF81/a/RkF/iI+Yw==
X-Gm-Gg: ASbGncvep+CHL8wCNCuoHgb92/2GVdJcZYTzKoDij/GHfSRUCk1OF9IhrNab170Nvo3
 mB9Gk27vkxMI0xVvP04L8HCp4XI5rryB10Is=
X-Received: by 2002:a05:600c:4fd5:b0:434:f2af:6e74 with SMTP id
 5b1f17b1804b1-4361cf91555mr19094945e9.15.1733920965050; 
 Wed, 11 Dec 2024 04:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLHRHmiBix5MBINE66d82uaNYd/BF+Fo550d7SIVpIwbpzZBw/ew9YpMiagOun/XntGkGTevs/pi553viM+h0=
X-Received: by 2002:a05:600c:4fd5:b0:434:f2af:6e74 with SMTP id
 5b1f17b1804b1-4361cf91555mr19094755e9.15.1733920964733; Wed, 11 Dec 2024
 04:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-14-pbonzini@redhat.com>
 <Z1hpT6F9jVlj2+ba@intel.com>
In-Reply-To: <Z1hpT6F9jVlj2+ba@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Dec 2024 13:42:32 +0100
Message-ID: <CABgObfYa1HZoRs+RVSxax02jAcMb86P3VM-fJa0KHHTTiDTuYw@mail.gmail.com>
Subject: Re: [PATCH 13/26] rust: qom: automatically use Drop trait to
 implement instance_finalize
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z6BQ8In7xTJwADiFvTNFatcBA0ZFIand9t4-lckveho_1733920965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 11 Dec 2024 12:42:59 -0000

On Tue, Dec 10, 2024 at 4:58=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
> Great idea. It nicely balances the differences between Rust and C QOM
> conventions.

Except it does not work. :(  Suppose you have

       pub struct MySuperclass {
           parent: DeviceState,
           field: Box<MyData>,
           ...
       }

       impl Drop for MySuperclass {
           ...
       }

       pub struct MySubclass {
           parent: MySuperclass,
           ...
       }

When instance_finalize is called for MySubclass, it will walk the
struct's list of fields and call the drop method for MySuperclass.
Then, object_deinit recurses to the superclass and calls the same drop
method again.  This will cause double-freeing of the Box<MyData>, or
more in general double-dropping.

What's happening here is that QOM wants to control the drop order of
MySuperclass and MySubclass's fields.  To do so, the parent field must
be marked ManuallyDrop<>, which is quite ugly.  Perhaps we can add a
wrapper type ParentField<> that is specific to QOM.  This hides the
implementation detail of *what* is special about the ParentField, and
it will also be easy to check for in the #[derive(Object)] macro.
Maybe in the future it will even make sense to have special functions
implemented on ParentField, I don't know...

Paolo


