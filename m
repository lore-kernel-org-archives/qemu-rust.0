Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tVC3Y-0000Yp-Bi
	for mharc-qemu-rust@gnu.org; Tue, 07 Jan 2025 11:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tVC3W-0000YK-BR
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tVC3T-00008b-P4
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736265822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asW1LTV43nxvAamuwi2vYstVviQNdc5YaTrUV6wVhDQ=;
 b=W+spvrpr1fmFUxUUmus3RRf826yHG0a6rqe6tLnsSe0G/uG5ENNYnXa18V9avK6cuCJ2yb
 ZPxltAM8VkxbPbFHJop3tFeypAYGr4mMR69Zn/GH1BI00MwXE1sEHLqp9LJdOfzlGZypDq
 Jubml72km/yK96KwQazPbEgdWgMX2sY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-u0kGfWFBONagNQlYwnn_Wg-1; Tue, 07 Jan 2025 11:03:40 -0500
X-MC-Unique: u0kGfWFBONagNQlYwnn_Wg-1
X-Mimecast-MFC-AGG-ID: u0kGfWFBONagNQlYwnn_Wg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38a35a65575so7493707f8f.1
 for <qemu-rust@nongnu.org>; Tue, 07 Jan 2025 08:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736265819; x=1736870619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asW1LTV43nxvAamuwi2vYstVviQNdc5YaTrUV6wVhDQ=;
 b=M5+iuKDNYEjeG77GuAQGI8IBTgnwgJOdpn34+TTrwDrlIIK/VDJ/tqQKstaFX7t+vb
 TLRxHI8C0dT80eLk2oOWGwBELSWgTQPVlISDlrD0pq+I4+UczU72ZKw41ln899mGd9jW
 dPuJCGPhxK+Yab4Az5DCf0KfV8gWhifTm94bCCW4D5VpsIxrgkMhzICILbKoYXyT7cj5
 W+tHOnb4i6ljjX3bAlQDdwZFCbn9516/FD3AtnuL5sPsyWb/RMoojwdiK1kQcdsMa1k4
 HtKuSJ9ih/KriP1hIdY87UvJal8dT2iJcjMNGsORJGQg5s43WfhDYaHF4k7GYY+AS6+o
 DM3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4lCAR2eOtYh/VlFJ5IUe+5kdB/ijScFrPPvphXUpgCqOmW7pAwoSTirzv6Ze1gY43SJ5qdKgUKYo=@nongnu.org
X-Gm-Message-State: AOJu0YwrJv4N3IRByxRblJNN8eb4vh/lwt7wn4+YY0seSIkd+cfk0jI9
 /Eb7H1oXAVMMVcSi/woOzqtfsgXSYC3//dJEOF8g3gUlBunZPLnx6l7bHgnH6dq2J/GTR3m7vZt
 UqLlErQp3ujqtp5offhr0xHhIu66o3Vx/mZiB5c1GTBuV1/JYjKqeCZzLNIX8jXp+IetS5ReZdJ
 mWucUZtKZ6o5J3MZC6oemZYvHEOw==
X-Gm-Gg: ASbGncvXwCCAqvFoH+pGC3TkBZ/4RebE75zvFvNGgGPLgqXb4RAYFfPKbOVIJnn+qzK
 Xudvb6b0vBR78GuyXnBsLCUSfdFC2/RLryTefAw==
X-Received: by 2002:adf:b30c:0:b0:38a:4b8b:1ba with SMTP id
 ffacd0b85a97d-38a4b8b01d1mr25459360f8f.14.1736265817311; 
 Tue, 07 Jan 2025 08:03:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERxQ6/ABSZdv5kOPinZ4nwpr4aJEp4gA0zNHvsvnSnq9SagQx0J4C6bnOL1FH5emPGLbpudobaqz19rhs/JhM=
X-Received: by 2002:adf:b30c:0:b0:38a:4b8b:1ba with SMTP id
 ffacd0b85a97d-38a4b8b01d1mr25459315f8f.14.1736265816855; Tue, 07 Jan 2025
 08:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
 <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
 <CABgObfYMP5-9uN9cLofPT6DzBS_o1CVfbHbY8pwn9xjdOXOqgw@mail.gmail.com>
 <CAFEAcA-PE1paXOJNUo-cihu__htZQUYogZphVhRAjFNFzgi7JA@mail.gmail.com>
 <CABgObfZ7FFW5yhA2u6Rt5=MndrLsF=BnNhgE73LAyUWUGF=yXQ@mail.gmail.com>
 <Z31OiMcYT/66AGDt@intel.com>
In-Reply-To: <Z31OiMcYT/66AGDt@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Jan 2025 17:03:23 +0100
Message-ID: <CABgObfZETbD03-H6=qOt6V8GY4ex3WP82i5axzdf_U0GCwsMbw@mail.gmail.com>
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WwyAo4t-c__5hASi4jqFVbyAm1o_8uc_r_q7WuPSFMM_1736265819
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
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
X-List-Received-Date: Tue, 07 Jan 2025 16:03:46 -0000

On Tue, Jan 7, 2025 at 4:37=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrote=
:
> > If anybody wants to do it as an exercise, I am happy to help, otherwise=
 I
> > can prepare a patch too.
>
> If possible and if no one else wants to practice, I would also like to
> give it a try (I'll add it to my list).

Hmm, thinking more about it, it does require a bit that is slightly
more complicated than I anticipated, which is a binding to
object_class_dynamic_cast(). I placed something completely untested
(except it compiles...) in rust-next. It uses a new trait
InterfaceType that can be used as

    ResettableClass::interface_init::<T, DeviceState>(dc);

but I don't really like the two parameters and also I don't like that
class_init is called differently for classes and interfaces. It's
probably possible to design a better API, but I didn't spend too much
time on it because it may require rethinking how classes are declared
(not a huge deal, as we have only four of them).

Feel free to give it a try, but it seems like a relatively low
priority item compared to upstreaming timers (i.e. HPET) and
MemoryRegionOps; or figuring out logging.

Paolo


