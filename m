Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td5mx-0003aZ-VY
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 05:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td5mv-0003UM-So
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 05:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td5mu-0001TO-Cw
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 05:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738148354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F1Z2b5SplCCulCnrThb1IgfVC3F5Flk3ECgk19GSKfY=;
 b=WCvzgufT7rn9heRW0K1pprKMBVAy/dcP4LLKUk+xkC+9oqK8B/8ZQTfS2Q0mewK8nt8Op/
 cwzR0srtRnABLy/c23h5YCFELi7IBOP7Dsn7WHKwvKoXQbGnMadSssWOLwFQZucKvH+rxf
 mUJ8ZS+Jr7XhSwL76VIJCskWhaPg/SM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-iKqut0_6OSK5L7Ix-P9phw-1; Wed, 29 Jan 2025 05:59:07 -0500
X-MC-Unique: iKqut0_6OSK5L7Ix-P9phw-1
X-Mimecast-MFC-AGG-ID: iKqut0_6OSK5L7Ix-P9phw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43631d8d9c7so3060465e9.1
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 02:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148346; x=1738753146;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1Z2b5SplCCulCnrThb1IgfVC3F5Flk3ECgk19GSKfY=;
 b=Zz75wAEkRpzSOH53KwCftdaNPDvVlqZsD/+FK+XH7s4kIApQWwIPvo9F2sV9Iaj8TH
 yLWQdVMN0EYKgyoGBMvWLJe3unhmvLN36ZDrXLuJUlEbDOeaNY+B5V1P02ttl/rQMRAz
 U5OUweFS3t57CW3SHFXJ4IGwn0tm/7VcI4gpj+a2J6vKjCQUwA4qLOxVlYk6jlrEaki3
 Obs6j/afKsf6byXN5wbmmdZRhlSctfti+7ALR+WUxedkUCTTxUvMta2+1lJ0EtU+ajNZ
 5dL1+eD4sKQolyEONssdE7i7Dqp0tzxqqqB6dCsygtqVETUlAn9i2AfKOkN+b+GhCZoq
 91YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOuntmfwqFcXoTGwabCRwilrRet43HXHM8BDjgoSpE+ZmoJSMECCpHb5nIcecYoaQ4qROfNbITwW0=@nongnu.org
X-Gm-Message-State: AOJu0YwZjucaVe1sPTy2PvguoliAaaLrbhMeRurWcknn/b6l2KsuEoju
 CwhyJk+jsif1/bZJNAPSPEPUMjYjjRjcu82wC0naNadfSKnaJggkUxuO+q1P5+u+AS4lSZd9Hgf
 H9tjsbDB8NC6Gw8fhEAbZ42sJHomjo2vh/msuCSJY4Ut/9tzhlWo=
X-Gm-Gg: ASbGncuw7aBsSheBGSNA6jbZJtZLr0URVhtSANAbcUD7UdWssZ9dKJ87pfRtoZITEcV
 25twUY0B46la++MKhiVc2e7ulwosAA5uEtWympgqLj8Fp2G7zz64blb6y3dSFGri0GwaJg3mYrt
 L3dL4agYxMCY/S2uE3L3rr1A1W/XUZJ+p6//WE29Opo8p8JCf5rmawqVfGPVa8N/f/K/tUG8N3w
 g0u5SlRtAXTm9l8AHEy8im9vGHNXPLavo2Cs6igVPv7WhqwdN/l3dL+rwgKQ4Cngw3beQE8qnHE
 WRLWnQ==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id
 5b1f17b1804b1-438dbe9a124mr25259265e9.9.1738148345907; 
 Wed, 29 Jan 2025 02:59:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpji0f2qhnG/LJPTman0u74BgwolbJa2Etkiau+0YR3gHpY/jMPjMYZ9BXiYs1iP84SpO+Mg==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id
 5b1f17b1804b1-438dbe9a124mr25259065e9.9.1738148345587; 
 Wed, 29 Jan 2025 02:59:05 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38c2a18867esm16401996f8f.43.2025.01.29.02.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:59:05 -0800 (PST)
Message-ID: <5a19e7d2-9d69-45fe-812f-84145229876f@redhat.com>
Date: Wed, 29 Jan 2025 11:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/10] rust: add bindings for gpio_{in|out} initialization
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
References: <20250125125137.1223277-1-zhao1.liu@intel.com>
 <20250125125137.1223277-5-zhao1.liu@intel.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250125125137.1223277-5-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZDXriIUH2D1WToAWxZFsZPzkLfM0MV_jafPjRwq_nOg_1738148346
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 10:59:18 -0000



On Sat, Jan 25, 2025 at 1:32 PM Zhao Liu <zhao1.liu@intel.com> wrote:
> +    fn init_gpio_in<F: for<'a> FnCall<(&'a Self::Target, u32, u32)>>(&self, num_lines: u32, _f: F) {
> +        unsafe extern "C" fn rust_irq_handler<T, F: for<'a> FnCall<(&'a T, u32, u32)>>(
> +            opaque: *mut c_void,
> +            line: c_int,
> +            level: c_int,
> +        ) {
> +            // SAFETY: the opaque was passed as a reference to `T`
> +            F::call((unsafe { &*(opaque.cast::<T>()) }, line as u32, level as u32))
> +        }
> +
> +        let gpio_in_cb: unsafe extern "C" fn(*mut c_void, c_int, c_int) =
> +            rust_irq_handler::<Self::Target, F>;

Please add "let _: () = F::ASSERT_IS_SOME;", which is added by the 
qdev_init_clock_in() patch.

Paolo


