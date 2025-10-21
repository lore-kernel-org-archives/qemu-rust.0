Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA470CCD1A7
	for <qemu-rust@archiver.kernel.org>; Tue, 21 Oct 2025 15:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vBEN1-00009a-UC; Tue, 21 Oct 2025 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vBEMu-00007e-T4
 for qemu-rust@nongnu.org; Tue, 21 Oct 2025 11:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vBEMr-0004hQ-VL
 for qemu-rust@nongnu.org; Tue, 21 Oct 2025 11:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761060824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3cdsfW6EeBnamcgWBUdM1pu88AGzMF8ezjONmhdoV2w=;
 b=ENXJP/MkgzYbjne8CY+HFVgqzg0cFhidVdz1mvWrCCeivCo4AlEo3JVaCcdTJJ958nBzry
 WT7y2i+SEdBV/3zbwZseSuy+/jsaQ+6w6EpsNqdkdPCBR9sbGZ+p016Sblw/FKrFgSOHEI
 FuzD1dEyUwu/IST6USesGlZdj2Az1ug=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-uEK47YYRO2ue68XPrMdAGw-1; Tue, 21 Oct 2025 11:33:42 -0400
X-MC-Unique: uEK47YYRO2ue68XPrMdAGw-1
X-Mimecast-MFC-AGG-ID: uEK47YYRO2ue68XPrMdAGw_1761060821
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47111dc7c5dso27315e9.0
 for <qemu-rust@nongnu.org>; Tue, 21 Oct 2025 08:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761060821; x=1761665621;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3cdsfW6EeBnamcgWBUdM1pu88AGzMF8ezjONmhdoV2w=;
 b=Lv3D9K/GCWuvPp11IjmPblda/W4qdP9DLCaA6lJbSTHfdqx8ggk3/hs51h2UIBTHgl
 kO+TX4Za8j7p12fhyg5/+2m0OFOsQk4Oz+ZSZa4AQBJ0X//pB/QxEiA0NwYNyAsQ7JUr
 yfsb6zDDjba+xEK4fon/wKPzP/ZPaLVQ6YBBHuGnLiGrAj3f4wHXGDC7mTT2ifafJeq1
 M4s9kJJCzR002lgmpJ++BNcuoALLrPBYvUgAt8H/Dc5+cE6UpjCDl+nq8T9inCDk+Zmo
 TYTlPK3Xf9dS8zOFrnmHc6yuYB/GE5mwlgcZ7OLORWdFT9wdKIExOVtJ2ifF3EkyUaCj
 gj8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTsGe/t9G/ZH/6wT2SrQVIyfkk6jHoYAKvDX08VASRWUUBwCBQdFJUjDwQYxuMLM7WJL7rzY6aRKk=@nongnu.org
X-Gm-Message-State: AOJu0Yxy/tUK4qF5QuxAnViYF3pOHLsPN8bfV8JtA0SlIxgzpsSCUnOj
 vEuuyze/z60v0Awrcz9k+ftXROrj6HXm8Kq46+TkX4Y3PK52vNJkY7LHXjnlIHKsFcJK/xtuoA6
 yPXtIUeMI78Apuj5TJXQ26IbpLK+EWuJDWpxfCRziWGQNkEVdGBNVisM=
X-Gm-Gg: ASbGncuCdUDwCQp5a7YSNAA58Sla0m5iqoE87TK9rEI/w4x6AzQizUG3fBbltwzVOfv
 ANgVwyzEXnOpmxRcTZ7mG+04miM8ZGP7LBcSu1eUj16wi9JtRX1eGPI90xh3mFBGOkQKIulXMYk
 QOkCPyBkGtHs3M2aV3UCnpm83SP2bdzgeBWmnxzfkiUX/sOvV/CC/JeuwN6q/4X2AECs1pMy1Z6
 AYzrFzwHjZvK8aFub4PIOSlZeIMXKLjklVCLiupy/YmlfOv6NTo0YK4zupB8ykMF2LUljn1hBVP
 IT+FnznRFqjti5Q50JtnvO8HvnFkuVsLeSKlnHvCKaA8XJP92KJV3V46Z25XJLsTjtyGH9+5Ytc
 vwvf4g7NyQf2smfJrOz6pG21bUwD4zvrXJZ8daRqz2/i1NeppUBviUm2VhNs+VsA50Skh1rlk/b
 vAiQ==
X-Received: by 2002:a05:600c:6306:b0:46e:711c:efe9 with SMTP id
 5b1f17b1804b1-475c3fda615mr391735e9.13.1761060821496; 
 Tue, 21 Oct 2025 08:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV0hTec/tsruMD5xvsXhR4WbQsi/vpqU0IBFAMSoLN1HWd3S5vgwxQztGKB+0XOrizaVK6Mg==
X-Received: by 2002:a05:600c:6306:b0:46e:711c:efe9 with SMTP id
 5b1f17b1804b1-475c3fda615mr391435e9.13.1761060821076; 
 Tue, 21 Oct 2025 08:33:41 -0700 (PDT)
Received: from [192.168.10.27] ([151.61.22.175])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47114423862sm289444305e9.1.2025.10.21.08.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 08:33:40 -0700 (PDT)
Message-ID: <61198e34-d7cf-43e6-b6d2-15cc423f5fd7@redhat.com>
Date: Tue, 21 Oct 2025 17:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>,
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Vijai Kumar K <vijai@behindbytes.com>,
 Samuel Tardieu <sam@rfc1149.net>, Gustavo Romero
 <gustavo.romero@linaro.org>, Raphael Norwitz <raphael@enfabrica.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Lukas Straub <lukasstraub2@web.de>,
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>,
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
 <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
 <aPePcTKl6s4FoLCL@gallifrey>
 <CAJ+F1C+bGKtY6nf3LCXrwhZ2aEdu2npXJ9FapmsqgX0uLL5TUw@mail.gmail.com>
 <f764e4cf-d134-4c4d-a313-a5b7dd6620d0@linaro.org>
 <CAJ+F1CKG1G=5o+bDBXmLm6ywWDD19z1OFBwQQnDMxMFytFQ2SQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAJ+F1CKG1G=5o+bDBXmLm6ywWDD19z1OFBwQQnDMxMFytFQ2SQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ht44ul9HEuVsrRLEhdpdrwWe5kPHd6AT1h1FLp_o7gY_1761060821
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 10/21/25 16:27, Marc-André Lureau wrote:
>>>>> I always thought the "frontend" was the device the guest
>>>>> saw (the 16650 UART or whatever). invocation.html has bits
>>>>> talking about "virtio hvc console frontend device" which
>>>>> seem like they also use that terminology.>>
>> Isn't it
>>
>> - backend -> host adapter
>> - frontend -> implementation used by guest

The frontend is whatever talks to the backend.  From QEMU's point of 
view it's the CharFrontend (which consists of a Chardev*, i.e. the 
backend, and some data identifying a specific frontend), from the user 
it could be /dev/hvc0 or whatever.

> Sort of, but I think it's too restrictive to name them after "host"
> and "guest", as they also have different purposes than strictly VM
> components/side usage.
> 
> I believe talking about backend and frontend is usually the preferred
> convention.
Yes, I agree.

Paolo


