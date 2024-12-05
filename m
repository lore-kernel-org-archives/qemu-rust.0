Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJAbR-0004AH-0P
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 07:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJAbP-00046N-DH
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 07:05:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJAbN-00043Y-Ii
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 07:05:03 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385dfb168cbso435103f8f.1
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 04:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733400299; x=1734005099; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2HOiS8hYlsV6WtZTOHrqLk0OHsgx5pj2URzo3Gus3rc=;
 b=PQw+ps01AOLAmxM/JOI+9ugUyCtENexs6KahfpXFa7eAv5lbk5kKnFpsMmQZ/3SiT+
 1ojcPxyl+QMbRwc2jjdMQbCaCGo8uZtFdQa2HB4G3s/Q8uKGYXaU2GSuI6D8KEvBzML/
 41uks+Qp332lo8KlrJWsQFUK0DDNqQjEfZFWWuNQXQ5/3tGchEpR1vxjGsW007mqYbhR
 1GkzTB0l9yjiRRjk569+n6nJWbVxQ2RUl9+5l8RwnhvC0Pwnekv2YpFHyEmkKa0DhPF0
 xiN8/UR70xj77rTt7aKSkNtoKzgiq2Kq3PpLRumFv4nYR2tt7aYNFI6o2yKRqVIgRcWe
 EJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733400299; x=1734005099;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2HOiS8hYlsV6WtZTOHrqLk0OHsgx5pj2URzo3Gus3rc=;
 b=iyaxQBZyZs9HvhbJMImuOfNNL1vBKguxKFrzFh/Xp39Fj3hQmfk+7XnjkMpc2krnQa
 53Yq+LXfZ/wsJ2hwEpwFMpD0taVtk7GeXJ0xy+gXVlFC53+CRCCvg92OlAaqz9XuiCMz
 quHRnJvCRCEhi2Oed8ZpCDdujrNMDgB32uI0epaBoeTRdNipnF17aMriGX28tgP1XuM2
 WJ2tpAxKlLIG5oKAOqjH2tE89D4qo27v2OC2j3yWBnHZR2htz1InPWPi+CVV8JxqwVVL
 RlbPZ/uCFrdIg31Me4ZfPbqbqnurWJIu1hr0jlbuboeIoOOzztKFf8VSyoJ3OFu9zEI/
 Kulg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOAcrmGTVXV+/u0TV4PaijppH6Oj27znim3o6HtegvMHKOuiuPw2VqJ248WwFV2j7eL4qx2qmY6Ec=@nongnu.org
X-Gm-Message-State: AOJu0Yw4Ci4JaEsU/1ws04YH7TNToxj49Gla8cN6WhvXRG7F0oRA3A6X
 WihJXruAgkpNt2QnJr/BZ4bU2/i/UBmyCIm9UNgnlyleylV+5keAwXW/xmHe6ts=
X-Gm-Gg: ASbGnctwDgwW/wUplnqJ/Agf1fYlKTEhjSqmcZQBYtxVc8G4O3i8KO2udrr3OcT0Bom
 K/bzfCbahJbXQu5M/pg1RUElzurgJ8KvkLAep6h/qBnK7x5WvrAtpyTPLoV87+LR/IW4T2u07Im
 KX8Zrn8LhFtGyw4frEldDweOb/1lmrh3xCwYIb5TLdiDrZdnyjDsK3Gw7VzHqujmkBTI8+R25uQ
 vqTjcfdYuzTsIsK78JR5jA/YlQNou7s6c7tPm1bdRHst8s65DNgFS1at/Hc8iwYimhlGpDcplH2
 CqG3AEgKR6QJ26I2tQ==
X-Google-Smtp-Source: AGHT+IGrxTLre+sFQlhn7qwJN4kwHSNTWS1uRqpLAipEULPpmlRmX1O62j2ZZ5XSJVi9GqJtATiUWg==
X-Received: by 2002:a05:6000:490a:b0:385:f821:e97e with SMTP id
 ffacd0b85a97d-385fd3c5a6emr8507629f8f.9.1733400299570; 
 Thu, 05 Dec 2024 04:04:59 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d526ac03sm60893605e9.4.2024.12.05.04.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 04:04:58 -0800 (PST)
Message-ID: <ed49af53-4a10-4cee-829e-d5921b8aee3c@linaro.org>
Date: Thu, 5 Dec 2024 13:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 09/13] i386/fw_cfg: move hpet_cfg definition to hpet.c
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-10-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241205060714.256270-10-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Thu, 05 Dec 2024 12:05:03 -0000

On 5/12/24 07:07, Zhao Liu wrote:
> HPET device needs to access and update hpet_cfg variable, but now it is
> defined in hw/i386/fw_cfg.c and Rust code can't access it.
> 
> Move hpet_cfg definition to hpet.c (and rename it to hpet_fw_cfg). This
> allows Rust HPET device implements its own global hpet_fw_cfg variable,
> and will further reduce the use of unsafe C code access and calls in the
> Rust HPET implementation.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/fw_cfg.c        |  4 +---
>   hw/timer/hpet.c         | 16 +++++++++-------
>   include/hw/timer/hpet.h |  2 +-
>   3 files changed, 11 insertions(+), 11 deletions(-)


> diff --git a/include/hw/timer/hpet.h b/include/hw/timer/hpet.h
> index d17a8d43199e..dbf709251a8f 100644
> --- a/include/hw/timer/hpet.h
> +++ b/include/hw/timer/hpet.h
> @@ -74,7 +74,7 @@ struct hpet_fw_config
>       struct hpet_fw_entry hpet[8];
>   } QEMU_PACKED;
>   
> -extern struct hpet_fw_config hpet_cfg;
> +extern struct hpet_fw_config hpet_fw_cfg;

Could this field belong to the (yet unexisting) HPETClass?

>   
>   #define TYPE_HPET "hpet"
>   


