Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1taY6i-00044L-DS
	for mharc-qemu-rust@gnu.org; Wed, 22 Jan 2025 05:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taY6h-00043f-IJ
 for qemu-rust@nongnu.org; Wed, 22 Jan 2025 05:37:11 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taY6f-0007of-To
 for qemu-rust@nongnu.org; Wed, 22 Jan 2025 05:37:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso48175155e9.0
 for <qemu-rust@nongnu.org>; Wed, 22 Jan 2025 02:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737542228; x=1738147028; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JClirEZhGSs2HNw1ii7DYoOZ+9JhtZcsAi84vf1O18Q=;
 b=Wf/60l3YYa6AGrBKvDme7dC03QC9WAez2Xx2yA4URcRdBOo6MeuxQqUoFF5qJSGj9Z
 pDwppsuLZMyZg/kFwPBh4xWns91Jkhga3TY3TqZTehbJmdNOyurRCp84lapLKCJvxFJF
 Gj6fhvE+aKFT+aDgT+v2OHRfMqAoMsbwUEl/9HU7+ZrYtbimon8Ly7BveDXZ8xl2TqiI
 KLU0tP0kiH5hhr2etQLosEH1Kaj+GQtJ0kaBpGWGIZPBliAnCdAfESO5/ZN9iAoqAZl9
 YbR1dU2/rCvJjMGLT11Qar2uM+lFqEeb7DAAlRQmIiqLzTTv1L+pT1rkC8SbGdtpkPNE
 oHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737542228; x=1738147028;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JClirEZhGSs2HNw1ii7DYoOZ+9JhtZcsAi84vf1O18Q=;
 b=ZmRMCQT4zQINUmk+uaoVL20jpWsiHPHVrYnnV7je3uvHL/4rDS31ftsoty9eht/sG5
 lprXnyMUutHIu4vOgcG4n3fgEgt6VVAnJGq7p6KijostKEmjVsatrPzkEAXtbXPCRSed
 1LDJoWckyHkL/LOBgL8CsFD250PRtU8EazGpdl30OJlqrdOuWQNvSVeoUMY/Hw2L+WXR
 CLMvEzqjB3d6Cwfa0AnhbSd8fpwAcy5jCaZg1iwLtJM058Rxdjn35vn70vn+wHZNgYPG
 b8kdm/srOEz8Ha3YBxUGue+Mk+5xifnH6IK04GXlpb7hREEewS/7qqjPlXCz9zeZo6u9
 OzDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9z1E6A8OY7GHLmsBJR+e9R1/AXt+R/UWt7yw0/H3F7tXYDpP7kw6IySMm/JRmx5TifRAvV586lB8=@nongnu.org
X-Gm-Message-State: AOJu0YwyQz/z/13Ttp2j8hpFp2fYKu4NWDx0a04FoVSFYPh1yJLBVpNV
 6k7NVqJLfwjkOcSfc858csyZy8PKjtpkVdQZLQe309TDgEzI4DYeCVKjDmuKOL0=
X-Gm-Gg: ASbGncux7w0PSnccgFHLjNoM6gO3Ao0lMUqeUavZ9TBpL7MUISFck7LGInjjHERBsLo
 H6NrWLzMpJRcKd9VGH45CKwjkT5kDFPmsSDjVPHzBukql0SrYTON8VKQwovMVMsD0DQ/ud4cRqv
 oUvUjxm+TU1s+NdYMl0AMHx/bfllv2uzFLXl/0Z8Ltf06wF/MwrYZlz2flfhRz3AMDdT5EiD4RZ
 /BGlBWM0w/jro8HPuW7krG0WSgjUgDcvMxKEkofKWh4dMjA3HUOMIhoAZqNiE+2Y9U3BHKqa3nT
 h5b0A5Gv1cqD/RT0+5txgrXe8g4/jKNP0H2kyg==
X-Google-Smtp-Source: AGHT+IEi14KAMMW3sfrZXONjud4kBqwnOBmFJqbWs3flgkvoIVrOJNAAad5R3xY4qo+hTqgUQ7RezA==
X-Received: by 2002:a05:600c:1e1c:b0:434:f0df:9f6 with SMTP id
 5b1f17b1804b1-438913bf655mr203889315e9.3.1737542227865; 
 Wed, 22 Jan 2025 02:37:07 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318c004sm19605455e9.4.2025.01.22.02.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 02:37:07 -0800 (PST)
Message-ID: <e8ba79eb-824f-4c9b-a224-026d5a3daa1a@linaro.org>
Date: Wed, 22 Jan 2025 11:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] rust: vmstate: make order of parameters consistent
 in vmstate_clock
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com, qemu-rust@nongnu.org
References: <20250117090046.1045010-1-pbonzini@redhat.com>
 <20250117090046.1045010-11-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250117090046.1045010-11-pbonzini@redhat.com>
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
X-List-Received-Date: Wed, 22 Jan 2025 10:37:11 -0000

On 17/1/25 10:00, Paolo Bonzini wrote:
> Place struct_name before field_name, similar to offset_of.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device_class.rs | 2 +-
>   rust/qemu-api/src/vmstate.rs           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


