Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tZvR2-00065V-D1
	for mharc-qemu-rust@gnu.org; Mon, 20 Jan 2025 12:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tZvR0-00064r-Vx
 for qemu-rust@nongnu.org; Mon, 20 Jan 2025 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tZvQy-0005FD-RN
 for qemu-rust@nongnu.org; Mon, 20 Jan 2025 12:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737393570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ktd98cBCw8JVjyAiUFx6Au5Zurp/46O2DsACOHf9WT4=;
 b=fGSpPij+Vhxyrlk7+j1tn0e3GOpV1WHvPYBSOS2fCXg4Tuui5Fh/GckTJ+H2UPWfKWT+T8
 0Z6qw0WTkUzjVAqedVMYZoqjFfYDVcONf1XidKNtWJKBohDk4DOHvFO6vHVpL+nhD+R4Tb
 ulC0JELC2KU8x0EvkOMLwE7LHqYy80s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-FHBEbUWrMxafozVEyrzigw-1; Mon, 20 Jan 2025 12:19:29 -0500
X-MC-Unique: FHBEbUWrMxafozVEyrzigw-1
X-Mimecast-MFC-AGG-ID: FHBEbUWrMxafozVEyrzigw
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5d3ded861f5so4665107a12.2
 for <qemu-rust@nongnu.org>; Mon, 20 Jan 2025 09:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737393568; x=1737998368;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ktd98cBCw8JVjyAiUFx6Au5Zurp/46O2DsACOHf9WT4=;
 b=P/NKw7J3zsYS+/QZn8vgjEaZE5GQhp9zD3CFzs2MP5erOWH8h05AEeSDuqBF2+sUD7
 QUZCFoh/ez8La7wSxU5MkI0t/amqVExg611Y1467XlOyt9c4Z3djivNoijOGxSe0ljnx
 Akfg5ZkAnzpi+A7X8bdGNMRInRAZYleEUJPo+XDQLyN3ighHp+BoijQlhrnl5tThDh4d
 YGSav/cCrDnXToHMkPZgfaG752LcixHaJCaJuGbbQiXcKO8SnnTU2IrtGv0bXSb87T20
 0Gc/xf4d2H8DCTXu0Vs9s0/wOPasrIj5wySVfydlApPYlohULkyXaVvYUiSpLi2Ysnwq
 jfEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPG5vfSuIGKehdSVl7nipau+Cz9pzyUikh+ruWOmNIfLBELhM4VSowk3XHwxZeXmIvp/KobsoC6F0=@nongnu.org
X-Gm-Message-State: AOJu0Yxd5MbnzktgCZR1nmbMCHgiM8LqhpGAlAZK3JBUi9GX1m2MqgLB
 RGyWrPF0mwdj64rLlTs+HYFafAzpMcG4OYKTOoFLO6TwqDPGlXm5LvKGB9RUX0wsqw6jUJNSumN
 LEXZ57lnORvn8upuXAF0Bxdiz0qFq8VtxFwHgDlrTLqlXOZHCp88=
X-Gm-Gg: ASbGncseaZGIV+I5L3miKH0JFru9DfguY1RxG1QZuOpKy0LInGOkMRQRQITPf3582MI
 DDB9gnXx4i2MtGLyM+gJaz5NYKZ4QmtQsP1cCM1AQmf316gBx9ComKxhiMAq5bxxO+8uJRHbvns
 oSczJ2rj2SJwQDN928K4kZal7yn8GWmZbqwV4D3AMfslWLtKHHQ5PFQolGsfa9bsfkLr1j4jp4U
 kLHk6giWHvUg3oadudWgJ/rOmsuxyX9bZb2S3Q0040QCz0TalVt5fZhGd4BCAukscMQkU/BHBc=
X-Received: by 2002:a05:6402:2686:b0:5db:67a7:e741 with SMTP id
 4fb4d7f45d1cf-5db7d2f5e87mr10353591a12.8.1737393568026; 
 Mon, 20 Jan 2025 09:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOAn6+Lome66MHjSFxjSSUcMMYuNlbvnnU7/+lp2sFJLkjqteW8r3ik/M5Kgkjx/pP9ABotg==
X-Received: by 2002:a05:6402:2686:b0:5db:67a7:e741 with SMTP id
 4fb4d7f45d1cf-5db7d2f5e87mr10353572a12.8.1737393567599; 
 Mon, 20 Jan 2025 09:19:27 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5db736716d6sm5917528a12.31.2025.01.20.09.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 09:19:26 -0800 (PST)
Message-ID: <e2920049-01c8-4ea2-8f52-b99ed0a559af@redhat.com>
Date: Mon, 20 Jan 2025 18:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
 <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
 <CABgObfZSR2s5AYEAcJfsdF0jKQGf_AVcDafKQq47qzLmBuX0RQ@mail.gmail.com>
 <CAFEAcA_dVnpN2Vn+VAf1XZSAdj183wJhQZ3pVNtb=NHeMOF2Jg@mail.gmail.com>
 <CABgObfaAdDtrLF4tWL17Lmw9UKiLRNVvuiDZsQxc-9Wd8W61Dw@mail.gmail.com>
 <Z45/MNYY5jD5fNET@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z45/MNYY5jD5fNET@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6gErtAqIXYTvMyQXyhFNxnmFQ6VEJVoITIWGP3UPuEM_1737393568
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 20 Jan 2025 17:19:35 -0000

On 1/20/25 17:52, Zhao Liu wrote:
> Sorry I missed this comment before...
> 
> Now I have a MemTxAttrs like,
> 
> typedef struct MemTxAttrs {
>      unsigned int secure:1;
>      unsigned int space:2;
>      unsigned int user:1;
>      unsigned int memory:1;
>      unsigned int requester_id:16;
>      unsigned int pid:8;
>      bool unspecified;
>      uint8_t _reserved1;
>      uint16_t _reserved2;
> } MemTxAttrs;
> 
> and its binding is,
> 
> #[repr(C)]
> #[repr(align(4))]
> #[derive(Debug, Default, Copy, Clone)]
> pub struct MemTxAttrs {
>      pub _bitfield_align_1: [u16; 0],
>      pub _bitfield_1: __BindgenBitfieldUnit<[u8; 4usize]>,
>      pub unspecified: bool,
>      pub _reserved1: u8,
>      pub _reserved2: u16,
> }
> 
> unfortunately, Zeroable can't be applied to __BindgenBitfieldUnit since
> event its member (`storage`) is private :-(.
> 
> But there's a solution to force (and at the same time unsafely) ZERO the
> entire structure in const:
> 
>   * const_zero macro: https://docs.rs/const-zero/latest/const_zero/
> 
> With const_zero, we can implement Zeroable for MemTxAttrs:
> 
> unsafe impl Zeroable for MemTxAttrs {
>      const ZERO: Self = unsafe {const_zero!(MemTxAttrs)};
> }

Another solution would be to implement Zeroable for 
__BindgenBitfieldUnit in bindings.rs, but this is much nicer!  It works 
even with old Rust versions and, even though it needs manual 
implementation of the trait each type, it doesn't require enumerating 
the fields one by one.  So it's better than the current version of 
Zeroable and, if you wish, you can also replace existing implementations 
of Zeroable with const_zero.

I wouldn't bother adding a subproject; just include the macro in 
zeroable.rs, with attribution and MIT license, and document that it 
might go away once we require a newer rustc.

Thanks very much!

Paolo


