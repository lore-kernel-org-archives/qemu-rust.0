Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0180D3C90D
	for <qemu-rust@archiver.kernel.org>; Wed, 10 Dec 2025 14:13:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vTKw3-0000Xj-O2; Wed, 10 Dec 2025 09:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTKw2-0000XU-CX
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 09:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTKvz-0001Ar-Oi
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 09:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765375970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bD7VQpcxs+TbhrRDYM1QFHTonaft9S0aXPWes5+S7Xg=;
 b=KJbTMsNEZMT0yULL4WWPE3xQGdXkP8AI/hLstIrXoYQAVn/3yHjZmZ2yFUz1U5FOIn2Hhr
 q6t/31hMRAi5x9CBmV1GGhmVl8h3YTyHsRKPbHABu7IswK2XXEvboJI+eJzZFPaCalZztV
 zzyz0hMj7A9aorRJb3qcurx6XsO+sZ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-Km_HCqDzNpiLpKe7FZwaaA-1; Wed, 10 Dec 2025 09:12:38 -0500
X-MC-Unique: Km_HCqDzNpiLpKe7FZwaaA-1
X-Mimecast-MFC-AGG-ID: Km_HCqDzNpiLpKe7FZwaaA_1765375957
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4779981523fso59285105e9.2
 for <qemu-rust@nongnu.org>; Wed, 10 Dec 2025 06:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765375957; x=1765980757;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bD7VQpcxs+TbhrRDYM1QFHTonaft9S0aXPWes5+S7Xg=;
 b=mIu6eUlLPCawSHV+9zysgqf+pPwyNBUaxz1+47Kr0ZLLjFMUxZQT+NnnKTDNmZ3MBb
 x47UU62g1tAucGMVKUIkAktXPrq3fTTiH/yRnbUZAoaJgIl6XfzyziJtPy+AcD8/LpBA
 MvIeDBlOzMGUSY8V7/cK/EJu2+0MeaLUFJCilnIQKdzztme1/8+DoWtuMowMjYlTicfr
 bWhwt+rNoh28wfGr+FejIUgYIwtNSpeosRgJm8CYpXohY+zA4AwAjRT2tcrFjGqpU0Al
 7jjKwWdcj6e+Fqd1Hz/hOYHGCe7QTtucqv2JVFffxuF7kvVXJ3QXxaygwxhuv8gdolGJ
 FvWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVjIBGhXqZlMJmN/NUWSec3v6tIMLK7A2uml9qAPIWs6zDyBSQAGg6TOD2ddrqn6tmykQH4oSaRkY=@nongnu.org
X-Gm-Message-State: AOJu0YwbJFwHWRIFpd8VL720cBjTT8b9V6ahOlylLpGWiMLJqKDhrpLF
 JGXFRftWORfXu6PixDnsMvdm2UbXpokVnw/6xuuua1h2tgXXnn14JS+vYJ+YuqLA3gSjhHWmMJ9
 OouzsmZMTZnePyfeLlLKpDX+j7vmZfL1cQsw/REWeWq9UF9b95FSw50c=
X-Gm-Gg: ASbGncvIh3Rp8kPIiWwm6CdWUAt7Lrpl7efMGztZTjcw5evng7i6nhqh0OodGZ5ADXj
 t2VyHk9W3B6NNd505vNYIqef3zuFzYrJdhDuu8ph6vsw+co594rdkoxU8ReOOTWoHIPX9tp27Xf
 o7c89iCb940aq/NLA3WNYQmZcp3VFL+ZbMYmB3Be1U6F3P3fnXex9QJ2NN0+tuqJkAK4oHyPeaK
 iyZzb5Lw3ki7kzQpdk16r1GjA+lMry78UHPx+M4z2+29PZVUv7WyI05ch3tTxXqpRbhdGC4NlvX
 QuxbyBCqJ1LicU9sxdCS0Q8pyxS1JGSedCrP6fn0zFtycTCgmFztl6rQ3qe0vgVkSvKf/8CrNPx
 vtVCGdbCJtm55XAzZXjrBhQ7DnPmtxTNAdw5Awnn4hEAPkKUT1P/ji+QOJMeByibdlFwuEO0ZXx
 5Wb+83NTjoZRcMQkg=
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47a8379c0fbmr27781475e9.30.1765375957463; 
 Wed, 10 Dec 2025 06:12:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhiVwTChDd/3XDYLxr+06OGfpaN/2udr1vtiMW39shQvpLPhuHFYoR62rkwb0oFfxPP7jr6Q==
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47a8379c0fbmr27781255e9.30.1765375957044; 
 Wed, 10 Dec 2025 06:12:37 -0800 (PST)
Received: from [192.168.10.81] ([151.95.145.106])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47a7d35713asm43967835e9.1.2025.12.10.06.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 06:12:36 -0800 (PST)
Message-ID: <525d2198-5d6f-43a0-88cd-78eae0042d27@redhat.com>
Date: Wed, 10 Dec 2025 15:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] rust: QObject and QAPI bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, qemu-rust@nongnu.org
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <87tsy52ftl.fsf@pond.sub.org> <87zf7s5h3k.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87zf7s5h3k.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Di3VgLiWimm4Zfe8otzwUzHT8t8q6BfDeM0YXAoE3ew_1765375957
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/9/25 07:01, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> I applied, ran make, and it didn't create qapi-types.rs and
>> test-qapi-types.rs for me.  What am I missing?
> 
> Looks like I have to run with -B qapi.backend.QAPIRsBackend.
> 
> -B is meant for out-of-tree backends.  Commit dde279925c9 explains:
> 
>      qapi: pluggable backend code generators
>      
>      The 'qapi.backend.QAPIBackend' class defines an API contract for code
>      generators. The current generator is put into a new class
>      'qapi.backend.QAPICBackend' and made to be the default impl.
>      
>      A custom generator can be requested using the '-k' arg which takes a
>      fully qualified python class name
>      
>         qapi-gen.py -B the.python.module.QAPIMyBackend
>      
>      This allows out of tree code to use the QAPI generator infrastructure
>      to create new language bindings for QAPI schemas. This has the caveat
>      that the QAPI generator APIs are not guaranteed stable, so consumers
>      of this feature may have to update their code to be compatible with
>      future QEMU releases.
> 
> Using it for the in-tree Rust backend is fine for a prototype.
> Mentioning it in a commit message or the cover letter would've saved me
> some digging.

Well, it wasn't intentional - right now it does this:

test_qapi_rs_files = custom_target('QAPI Rust',
   output: 'test-qapi-types.rs',
   input: [ files(meson.project_source_root() + 
'/tests/qapi-schema/qapi-schema-test.json') ],
   command: [ qapi_gen, '-o', meson.current_build_dir(), '-b', 
'@INPUT0@', '-B', 'qapi.backend.QAPIRsBackend', '-p', 'test-' ],
   depend_files: [ qapi_inputs, qapi_gen_depends ])

so "make rust/tests/test-qapi-types.rs" will work, and so will "make" if 
you have --enable-rust.

Let us know what you'd prefer and we'll switch.  Alternatively, 
retconning -B's meaning so that it applies to Rust will work too. :)

Paolo


