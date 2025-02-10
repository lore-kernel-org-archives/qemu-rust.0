Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1thRBN-0004q0-P5
	for mharc-qemu-rust@gnu.org; Mon, 10 Feb 2025 05:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thRBL-0004pF-UE
 for qemu-rust@nongnu.org; Mon, 10 Feb 2025 05:38:27 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thRBK-00051L-BS
 for qemu-rust@nongnu.org; Mon, 10 Feb 2025 05:38:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43948021a45so3952665e9.1
 for <qemu-rust@nongnu.org>; Mon, 10 Feb 2025 02:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739183905; x=1739788705; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lpf7FzddLbD4vLLtsiKhL3Io/bhh7otLZC+2D8nsEv4=;
 b=ojd42LLHcUYWkh6tOYF0nLgg2iT2ZGi16E3wzPbD5Vq0tPA4c+wYhivThqjzXD6ScG
 p232ZYbvDx38UBq0rK/LORLnjaO5Eflj2CKA7EQgpRJYZcDsQiRpdHJ+ft6s/ei8gUSI
 jLczxGriEkD7ndypJIADS/BinnbTVesBesHl1sAplQlXTQ3QY65AS5VNJuchEDWoaTmt
 H4lylFMNbPW1qHQPzM2UkgW/EIRv5EkjDxtb7jRQ842YTI4jPpJYdp/1qV4uxX8mrwC7
 Jd9wiP1DWOe7PxBaxQAUe6+wlgH77zeQXz5aABT+cRPYKp2hI7G7v1mBSZeIqeofMPnP
 WJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739183905; x=1739788705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lpf7FzddLbD4vLLtsiKhL3Io/bhh7otLZC+2D8nsEv4=;
 b=ob/FJzXuO5y6H/svwrmzlwLy2ynT7ZrtbCfMsZSy3kLXDud0qvqG1mEq5Zq1R6U70Y
 7E3QQUIAvMyMqim0z8O4TwEbzRequW1sykbA/7zx6ALXkGw075WIQnZnNyYVi2VwYKdk
 UqEfuW7orqWoRed1PpIncopcwZYTykRL07P2oDVZS7Q08FJpuVRT6PfaesBhygPkP1ff
 vBJg+kCra1CacdKfx/1v9gm697rdlRIOLFaI0eMUwp25ZIemaFClG+btP/xsN0NiS06c
 4X7NUeBeqsLD/IqCjJxgnU0ZCI8pHNOXmn0QmQzvRB30NO+iOjRds4SCg4bt/v2wwNXR
 M2VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCTZ4hXNoo8uuP0y0Gcspp4ZJiPY1XGQKUQMnH0SDLpGBQqQmYibjf8cD9dtjPplHaGM108gzbOo8=@nongnu.org
X-Gm-Message-State: AOJu0Yxo9hXmt8PhdvPE/bS+BIp69KbxA/udD7pu4eMTeXfe3uud76gw
 u+Lse8q2t5bbV8qyg5PQHd+Y48j8MgBMFLMtgaRElKkA3MYpSwLVKyXsucMA1xI=
X-Gm-Gg: ASbGnctyL5CAEey99g98z7SES8dA+SNwBw2yRz6wbmfnvISk5JCs01ZYJyNgUXd+v5t
 wByoZLCnecvELZHKzdaV2b00d1TprHn75sTKChcjPGwWSWP2BswAkkS7bxYbIlenBR8bGhaEbWB
 hxH/+wNs47SryEiw2ak8NVhTfnig8gO7Q7ogjcvhJWnAJINlv9ATfiYfZT4vX73F24FLEjMQRh2
 xCuQhA8XFZt1VO2Oy7DKAcV2hz9+O6uaaQXsAutmOM3gk/OlHetgj5YJcl+jQnbB+1GSA6OCNAE
 MTopBpnpehpjX+DSY74oHi9yZEubQroh1fl92ktyWuR95/XXVfXPXlcVSJbrrd0a
X-Google-Smtp-Source: AGHT+IEjTjiXs/QEXVN3KlTYMJcoSvjiXLmMFWXUIJdBlJg8alBcD0uQd7FB01FvbX2ux2umuL0hYg==
X-Received: by 2002:a05:600c:1c92:b0:439:4589:1ab0 with SMTP id
 5b1f17b1804b1-43945891dd3mr20448535e9.13.1739183904670; 
 Mon, 10 Feb 2025 02:38:24 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm178374205e9.30.2025.02.10.02.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:38:24 -0800 (PST)
Message-ID: <ab658338-5638-4f75-9ece-a160745fe82d@linaro.org>
Date: Mon, 10 Feb 2025 11:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com>
 <7e35b5b6-01dd-457b-b36f-507a85300b45@linaro.org>
 <CABgObfbr4yHBJxCVtOk9rQau3Z8M-QUy0+OqTnjecTsKTXrH0Q@mail.gmail.com>
 <ad5dcd1b-ae0e-42ac-befe-a33b3f900c71@linaro.org>
 <3953673d-873b-4379-9bff-c9bf68130b75@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3953673d-873b-4379-9bff-c9bf68130b75@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Feb 2025 10:38:28 -0000

On 6/2/25 11:19, Paolo Bonzini wrote:
> On 2/6/25 11:02, Philippe Mathieu-Daudé wrote:
>>>> Could we always make .valid_sizes() explicit?
>>>
>>> Yes (for example build() could even fail to compile if you don't have
>>> impl_sizes/valid_sizes set), but why do you want that? I'm not even
>>> sure that all cases of .valid.max_access_size=4 are correct...
>>
>> Exactly for that :) Not have implicit default values, so correct
>> values are reviewed when models are added.
> 
> But I wouldn't bet that those that we have in C are reviewed and 
> correct...  They are incorrect if the hardware accepts 8-byte writes, 
> either discarding the top 4 bytes (then impl must both be 8) or writing 
> to both registers (then impl must be 4).

Are you saying in general or for the pl011 model?

What I'm asking is to have all rust models explicit the min/max sizes,
regardless of whether the C implementations are correct or not. For
rust models, we won't rely on default and will have to check the
valid range in the specs.

