Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D791C87FCA
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:53:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk134-0000e7-B6; Thu, 07 Aug 2025 09:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk12z-0000Zi-GA
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk12y-0000WA-0U
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754574762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jvula5eCMbUGkLkKPyBhGU5eLiLfuloHOPJZUTCCHYA=;
 b=ZXvaGEgrgpo1+h7760e9pGBVMEe/9v1XtlgApAc/d4teMr7efbOYQ+gGGS59LpbI3sQbuu
 BwYSaitT7qL1XJFoiL90NOTszqhEQSeVNY1Wc1JBd8fGIw31kBWbCHJKO5p6isv5x5/YX3
 5yhFSJK4KXCSyM67wq0e6h89brSt74g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-tocKy904M0SjKHH6KHhWzg-1; Thu, 07 Aug 2025 09:52:41 -0400
X-MC-Unique: tocKy904M0SjKHH6KHhWzg-1
X-Mimecast-MFC-AGG-ID: tocKy904M0SjKHH6KHhWzg_1754574760
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45526e19f43so3810585e9.3
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754574760; x=1755179560;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jvula5eCMbUGkLkKPyBhGU5eLiLfuloHOPJZUTCCHYA=;
 b=Rowoka6CfQlyTjRUOdVbam2kScGqlrNR0NE1PUlXVhz0tkdPJk92SPfXOjMJx7a3kp
 rvX7gIgAAfPamzsO0w+q4lB4RZpwOYWGRY4enozTNrgKrepTllbjfyPx2nW+v3PXkiC/
 0FnC+TKKyHF6heQ4sATIl29Uk9px2cyPKVO20Khst4TCELmzm8Brafbe0LXQYZT1iJXz
 VrXY/kIfBxZrpbVriXYwwACzM69Drt0nBby9yp5186/HEjIhZXXa1NtjpXqUJqgONTRP
 thDb/O/ZiaG7v2Zjykq3dQ1t91I8NdWHeXlIq6XDazhfDvmgKV/uRSe8TynkK4guV3Vu
 nLVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5CyZA6xn3TGGRTb06AQJiT/5y50B9PJrH/nyGoWcyEJIqYyG7mQV5+XlPYYCqut+ktPD1ddNphrs=@nongnu.org
X-Gm-Message-State: AOJu0YyG2SBgbobIMgzmm1OMnnNbdI61ToafDKTyO0ul5TPb17rTKmvd
 EbLWP1bbXvsJaa0DhbzXDFgzpBsQ2+0sRQb/MgPdp0ObaAkHKJ50rMqDCK9b5tDDG2S1e5MJsg8
 IkOlMMDQcKN3Z/4JRfIpa2q5y1X7ESiUT9n0HlU6wgxlND+4W/uAMiig=
X-Gm-Gg: ASbGncsPKcRx57X0kcOwVvMGh8lXSEjX6EZGhb8lkvKNWSvMu2715mdNFPsnB7Bhzbk
 aps7wkY4DQN5Txc819OxEj7oh6GzPbufWJpG3kbrY65BLFHbrj4qEO8bWXGdYrw9sFyt1wl8+7X
 jXCMhb3we8zHlKFaRM2LiQa/S8iiAwthexDuhDgQnKMj+d5J4G8FyRDapU8eulaotZQhDgbbnCI
 pKJln7KG5CDLcMMvLuflfN6gv8jYom9CJDzL/PSf04y5Uwb8zAQZALQkXhh7TKmYSRE0g2RBkr7
 KcWmcuLcq3vgSYuK3u5Nt7BZVSM/tJUQsje6+I8yBKj8
X-Received: by 2002:a05:600c:3b22:b0:459:db5a:b097 with SMTP id
 5b1f17b1804b1-459e70eeb97mr68530375e9.16.1754574759676; 
 Thu, 07 Aug 2025 06:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtmGLo8uaep6GbSM9+eeuqEBVyQbsJ5sriF+VdjL7eX0xrcwqLIJyJ+Vdar58LStw+f73iYQ==
X-Received: by 2002:a05:600c:3b22:b0:459:db5a:b097 with SMTP id
 5b1f17b1804b1-459e70eeb97mr68530105e9.16.1754574759236; 
 Thu, 07 Aug 2025 06:52:39 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.253.173])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-459ee17535bsm43001965e9.16.2025.08.07.06.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:52:38 -0700 (PDT)
Message-ID: <4cc91b3d-ce3a-46fa-80da-fa5039f6a490@redhat.com>
Date: Thu, 7 Aug 2025 15:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/26] rust/hpet: Fix the error caused by vm-memory
To: Zhao Liu <zhao1.liu@intel.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-2-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250807123027.2910950-2-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k4AA1gZ70nZWvu58UaVzpUNryl_8PK-tg0_bhXzfK7I_1754574760
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On 8/7/25 14:30, Zhao Liu wrote:
> error[E0283]: type annotations needed
>     --> hw/timer/hpet/src/device.rs:884:55
>      |
> 884 |         self.num_timers == self.num_timers_save.get().into()
>      |                         --                            ^^^^
>      |                         |
>      |                         type must be known at this point
>      |
>      = note: multiple `impl`s satisfying `usize: PartialEq<_>` found in the following crates: `core`, `vm_memory`:
>              - impl PartialEq<vm_memory::endian::BeSize> for usize;
>              - impl PartialEq<vm_memory::endian::LeSize> for usize;
>              - impl<host> PartialEq for usize
>                where the constant `host` has type `bool`;
> help: try using a fully qualified path to specify the expected types
>      |
> 884 |         self.num_timers == <u8 as Into<T>>::into(self.num_timers_save.get())
>      |                            ++++++++++++++++++++++                          ~

Oh, interesting.  In this case, you can write:

     usize::from(self.num_timers_save.get())

Paolo


