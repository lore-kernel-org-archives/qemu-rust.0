Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tAvvn-0005TL-EV
	for mharc-qemu-rust@gnu.org; Tue, 12 Nov 2024 13:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tAvve-0005SG-V5
 for qemu-rust@nongnu.org; Tue, 12 Nov 2024 13:47:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tAvvd-0005zJ-Jt
 for qemu-rust@nongnu.org; Tue, 12 Nov 2024 13:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731437272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2J5LUaqbF74UXAPfpVbBk1nCOk52WIrVwJQx2hoDH7c=;
 b=M3ScK2rBP9qWoOkKeVdqJfozyewF7z0ZXpSo61Yt8aB7F9E5EuYBPErBFjIzyupEwDFEsh
 m+Tkgw5EyHDuIhUZgd75f/Tg6TimM2VcBx/y0zTV04RVzlKoxoYR54cuc5Ah4qBMpHJMxu
 2K9sGkf0jYXaWq2LXfR8VmG6TM5LD7o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-xpMa91-3MH2fX8tFJ4FokQ-1; Tue, 12 Nov 2024 13:47:46 -0500
X-MC-Unique: xpMa91-3MH2fX8tFJ4FokQ-1
X-Mimecast-MFC-AGG-ID: xpMa91-3MH2fX8tFJ4FokQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-431ad45828aso44958305e9.3
 for <qemu-rust@nongnu.org>; Tue, 12 Nov 2024 10:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731437265; x=1732042065;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2J5LUaqbF74UXAPfpVbBk1nCOk52WIrVwJQx2hoDH7c=;
 b=Sy/z19bsPT1SlJH/TnXj+1nzZO6nyRrHzgxiXEQuBeM0mg/gKFmSV+ODlRYLXt/dd+
 tSGipKSdQv0wbZsFjcoI5s6tP8j9zQg2IW2b1qP5LDrNy7wISwmGpR8hJ0mnAdDHgHD3
 XrClMaEhwawj0A+yRHdgKOYVd8SK+vLzCU7PmQXkWb8OSD00+Vc3jdVTYozhxw00wtWt
 F4TfoVkS6QYc+bcNsbSGKlKBU1Kj/erahhINx42tdATjdcXEi5vg6rvE6hvNo9bG9ceX
 V0psSwMyN/fdywmpaLDG/YRKtNGSoUjqbqiv5lyOKnbP2IJfY3RxmlE4NGlgRbz+s0Pa
 WAmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8AsQTwngoGjfJ5umAXRoBbCEB8zADeELDY6AUtjgEAd7bszYeIrwCvfloe/2JsDXGDBqF4b0aNJw=@nongnu.org
X-Gm-Message-State: AOJu0YzDx8oHe3z0ic8MA4snsQFyPpRNrrIINyaJdpiwHe8UE/9ISEQH
 3CIV78pdFcp8veblZ8g/X3lTjCOIxt4Dh5xqVUu4SXA6yGvAgl88oYHiamYg8BRs9A+OzbwqHkW
 4OSDCiWok0MiQlXO5kUkueftCQ2AXMh19JNZNUwAL86CrN+zuok4=
X-Received: by 2002:a05:600c:35d3:b0:42c:b1ee:4b04 with SMTP id
 5b1f17b1804b1-432b751c264mr139984415e9.28.1731437265389; 
 Tue, 12 Nov 2024 10:47:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHno4G5YuNmMgTJhF1+JgHmVBeOyJJyr0PTZurwfLb0l9NEb/yh3oAlTmR+3DtlwcD8FTtldw==
X-Received: by 2002:a05:600c:35d3:b0:42c:b1ee:4b04 with SMTP id
 5b1f17b1804b1-432b751c264mr139984295e9.28.1731437264979; 
 Tue, 12 Nov 2024 10:47:44 -0800 (PST)
Received: from [192.168.10.47] ([151.49.84.243])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-432b05c1a13sm219402665e9.29.2024.11.12.10.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 10:47:44 -0800 (PST)
Message-ID: <6e1fce37-4a22-4f36-9798-a424e4ba43d4@redhat.com>
Date: Tue, 12 Nov 2024 19:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] rust: qemu_api: do not disable lints outside
 bindgen-generated code
To: Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Wolf, Kevin" <kwolf@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-rust@nongnu.org
References: <20241108180139.117112-1-pbonzini@redhat.com>
 <20241108180139.117112-2-pbonzini@redhat.com>
 <SY0P300MB102699E99096F482F06296EF95592@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
 <CABgObfb9ujpoRrNUUqyiAefSfTOWSV-SGmo2YrSoMdfxBeAD9A@mail.gmail.com>
 <SY0P300MB10263A5B33FAAEDCB04CDCD295592@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <SY0P300MB10263A5B33FAAEDCB04CDCD295592@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uO6emAo3JuMfZWCOa7Iup535jVvGtvBxAixByChlmeg_1731437265
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
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
X-List-Received-Date: Tue, 12 Nov 2024 18:47:59 -0000

On 11/12/24 11:10, Junjie Mao wrote:
> diff --git a/meson.build b/meson.build
> index 1239f5c48c..8cea09ffe1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -4,6 +4,7 @@ project('qemu', ['c'], meson_version: '>=1.5.0',
>           version: files('VERSION'))
> 
>   meson.add_devenv({ 'MESON_BUILD_ROOT' : meson.project_build_root() })
> +meson.add_devenv({ 'CARGO_TARGET_DIR' : meson.project_build_root() / 'cargo' })

I think I'd rather avoid using CARGO_TARGET_DIR, in case someone forgets 
he/she is in the devenv.

>   add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
>   add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
> @@ -4083,7 +4084,7 @@ if have_rust
>     bindings_rs = rust.bindgen(
>       input: 'rust/wrapper.h',
>       dependencies: common_ss.all_dependencies(),
> -    output: 'bindings.rs.inc',
> +    output: 'bindings.inc.rs',

Needs a comment, but I guess it's okay.

> -    println!("cargo:rustc-env=BINDINGS_RS_INC={}", file);
> +    let out_dir = env::var("OUT_DIR").unwrap();
> +    let dest_path = format!("{}/bindings.inc.rs", out_dir);
> +    copy(&file, Path::new(&dest_path))?;

A symbolic link seems to work too.  Thanks for the tip!

Paolo


