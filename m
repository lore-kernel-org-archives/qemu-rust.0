Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ti93z-0002Lx-HI
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 04:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ti93v-00028n-7r
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 04:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ti93t-0001Xd-AH
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 04:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739352580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7nUGeHi1FpuLKQqy/QV1lGxaUaS2V8jslKj+FykpJX0=;
 b=etpZj3xnBB/02SBu3Q58KBctEBmha8hpUlFPcvFsDXK8SM2l8n3JNrytA3TnRfWq2YfhaH
 AQKQaiicbkuimVxfsB3NXRkipnLbKtEYE2JPNgM9G+MkJLPQMJMqV3WAJ+KiELgMDrXT3w
 nHH+Whn4PmXDi44wPlyI6KHmcXFcqWE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-mt_rCJa0Ml6DkaeuKJsYjg-1; Wed, 12 Feb 2025 04:29:39 -0500
X-MC-Unique: mt_rCJa0Ml6DkaeuKJsYjg-1
X-Mimecast-MFC-AGG-ID: mt_rCJa0Ml6DkaeuKJsYjg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dd533dad0so2479391f8f.0
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 01:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739352578; x=1739957378;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7nUGeHi1FpuLKQqy/QV1lGxaUaS2V8jslKj+FykpJX0=;
 b=RmAuoQEcAgcMGnPQ7ydtYEmf8UDPjwkbkvIm9Zp2cc9Mn8jaKWcI9bVrnvW92RMqpI
 pKE42qU20AsARQhB9bM8VqNJGHuutY9LSxGG6YU0taol69CIN7BBEQ+HaLmb8G1U3aNb
 M7iRjNclMJa+vsIJyEhDzMisiOpS4zmGhgulsixxl+fXgeOvsIIs/oVwNTS5h9TsXOhN
 2jnJpzaFQB8HTYaR/LNjQWZQRm6bvl1YMCFXJ5htdNf184ciNaxkKFIpjbYSp05Db98M
 kX72a/ZOv2RO+WKYNcbN7fE564ZtGIOYmt3C1vKxOn7a78uk21vYkm2FURyqgGXHTxNd
 hjhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtXq02sLLeN8O5NNwdNrksaZ0G1l0w/6o60NM2hF0GKvc09RORDXxDD6U9wvYEhjui6hK6zsVDPo=@nongnu.org
X-Gm-Message-State: AOJu0Yw670+HAqSRCX27PxAm1Lu+zZYI7N++1vNylUDhPSBnkO3n3UQV
 nacT8U5WqKwiHI4I+txE0OvlCshnfnbxfDqxZZCrSVIhXb98zptuh9clQxGEgiFyx6LotHNQ7Wa
 Xj8OLBDKuglMMtFioXDtyAUQ0JpAbnlX9oGRI+hwTQ+26/LtpvV8=
X-Gm-Gg: ASbGncvisQhDZGTtcTRWSBZBd8m63Z2gJoPSnfQpFDzcso2ly6IfiP5F6L91A85sHjd
 3QVFjRuMEtuyDwLV935RHTz85YjSLPb0LLnzuMMAbDzCtbiv8G91b2Imcl0En/rrpWIY0pPKBzk
 3kqHsWvMoSwY7aIZZU9dgWpqSaU0G0bNKF7OrkGU9j4I97f0L12G1iJIXjEYv2al9YQJ7bfk9QY
 84pSJyFzeCpBQsUQcFbjPg4uBrB9l/Hg4ktroZH4IN305gXh2Wbd4zNx0V74jmbu8huOzgLKODD
 lAQf33I=
X-Received: by 2002:a05:6000:1842:b0:38f:2073:1493 with SMTP id
 ffacd0b85a97d-38f20731b9dmr554081f8f.15.1739352577976; 
 Wed, 12 Feb 2025 01:29:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDv1wp06e00Y9hKmamXbY7aaT1zXtbxVkwwpogWH/pRDF2evFNZoBpsAtsnBTUI2PQKZWkgg==
X-Received: by 2002:a05:6000:1842:b0:38f:2073:1493 with SMTP id
 ffacd0b85a97d-38f20731b9dmr554054f8f.15.1739352577559; 
 Wed, 12 Feb 2025 01:29:37 -0800 (PST)
Received: from [192.168.10.81] ([151.95.148.6])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38dbf2ed900sm16820179f8f.53.2025.02.12.01.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 01:29:36 -0800 (PST)
Message-ID: <b7b2ab97-acd3-4008-abd6-3da874541113@redhat.com>
Date: Wed, 12 Feb 2025 10:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] rust: Add some block layer bindings
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, manos.pitsidianakis@linaro.org, qemu-devel@nongnu.org, 
 qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-4-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250211214328.640374-4-kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rG-P9TV-GRoico4vN5woWeVyiNbdQ0W1CpriT93_xw8_1739352578
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.54,
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
X-List-Received-Date: Wed, 12 Feb 2025 09:29:43 -0000

On 2/11/25 22:43, Kevin Wolf wrote:
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   rust/wrapper.h                | 4 ++++
>   meson.build                   | 1 +
>   rust/qemu-api/src/zeroable.rs | 5 +++--
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/wrapper.h b/rust/wrapper.h
> index 41be87adcf..c3e1e6f9cf 100644
> --- a/rust/wrapper.h
> +++ b/rust/wrapper.h
> @@ -53,3 +53,7 @@ typedef enum memory_order {
>   #include "chardev/char-fe.h"
>   #include "qapi/error.h"
>   #include "chardev/char-serial.h"
> +#include "block/block.h"
> +#include "block/block_int.h"
> +#include "block/qdict.h"
> +#include "qapi/qapi-visit-block-core.h"
> diff --git a/meson.build b/meson.build
> index 30aae6b3c3..154195bc80 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -4045,6 +4045,7 @@ if have_rust
>       '--with-derive-default',
>       '--no-layout-tests',
>       '--no-prepend-enum-name',
> +    '--allowlist-item', 'EINVAL|EIO',

I've got some errno bindings that I wrote for chardev, I'll send them 
shortly.

Paolo

>       '--allowlist-file', meson.project_source_root() + '/include/.*',
>       '--allowlist-file', meson.project_source_root() + '/.*',
>       '--allowlist-file', meson.project_build_root() + '/.*'
> diff --git a/rust/qemu-api/src/zeroable.rs b/rust/qemu-api/src/zeroable.rs
> index b454e9e05e..60af681293 100644
> --- a/rust/qemu-api/src/zeroable.rs
> +++ b/rust/qemu-api/src/zeroable.rs
> @@ -56,7 +56,6 @@ pub unsafe trait Zeroable: Default {
>   /// ## Differences with `core::mem::zeroed`
>   ///
>   /// `const_zero` zeroes padding bits, while `core::mem::zeroed` doesn't
> -#[allow(unused)]
>   macro_rules! const_zero {
>       // This macro to produce a type-generic zero constant is taken from the
>       // const_zero crate (v0.1.1):
> @@ -78,7 +77,6 @@ union TypeAsBytes {
>   }
>   
>   /// A wrapper to implement the `Zeroable` trait through the `const_zero` macro.
> -#[allow(unused)]
>   macro_rules! impl_zeroable {
>       ($type:ty) => {
>           unsafe impl Zeroable for $type {
> @@ -110,3 +108,6 @@ fn default() -> Self {
>   impl_zeroable!(crate::bindings::MemoryRegionOps__bindgen_ty_1);
>   #[cfg(feature = "system")]
>   impl_zeroable!(crate::bindings::MemoryRegionOps__bindgen_ty_2);
> +
> +impl_zeroable!(crate::bindings::BlockDriver);
> +impl_zeroable!(crate::bindings::BlockDriver__bindgen_ty_1);


