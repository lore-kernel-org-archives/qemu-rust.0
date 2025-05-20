Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHOhm-0000cQ-OQ
	for mharc-qemu-rust@gnu.org; Tue, 20 May 2025 11:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHOhk-0000bu-DW
 for qemu-rust@nongnu.org; Tue, 20 May 2025 11:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHOhh-0004tz-GU
 for qemu-rust@nongnu.org; Tue, 20 May 2025 11:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747754186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pMbS6MXhAVfMMV0Lqo565rdqCrpEbuGU9c6h4Nte618=;
 b=b3BTVohoR0HM+6VG7DxM+CD+XjKUZBa9IOtgDINuRaB4fJwcOMK4FmX8kz9z3aYRX/Z2Tw
 GY2kFC5XqUqEcgT1gHF6z0MgWP20meHIFmyl3Hi/wgSVFgwXkKT+Oh+6BrlIUU5+yvBxj0
 jJMGHicWXGCRg/RHyT9Tc9e/LLpHkLc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-XHkkNRm-OqmSGRZbg1_s8g-1; Tue, 20 May 2025 11:16:25 -0400
X-MC-Unique: XHkkNRm-OqmSGRZbg1_s8g-1
X-Mimecast-MFC-AGG-ID: XHkkNRm-OqmSGRZbg1_s8g_1747754184
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a370309dcbso1154002f8f.1
 for <qemu-rust@nongnu.org>; Tue, 20 May 2025 08:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747754184; x=1748358984;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pMbS6MXhAVfMMV0Lqo565rdqCrpEbuGU9c6h4Nte618=;
 b=bS6DASKXozt+u82oNkNVBN5/C4C3+GUfRJnMMU+eqpzhDR763n9dNRVbr4qsGYWKY2
 MmgfhnumvSobQO88FTltxrPlm132ZtTyrSmRITIoASwn7QoXiSGsybear1+1PsZQRt8z
 Q2vcedZof2CDDqtRFIuia4RuiV+p7lLLb0BJnW/LtaBNs+ThV+wloO7oDVkFHB+X2mIA
 kLbY1MJEkBeT77frPrxz0Be4FQxfzNa+MmlwjwljJVlMEvURdu8WYZ5Le2L8VA7YH2oU
 WxDPVk/DQW1VdoItJkqTEVgAkOAQrtLDwRp2L6Gg9i4B1DlTpNd27bNIwS8/HgDsUZYx
 K0Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp3PyaKaWWXN950TcqKwkKz/4wx0MK5jGT2ZPv4ePfChR/REGne6Akv7ISPsiwL2Iv3TDFbtqLnSg=@nongnu.org
X-Gm-Message-State: AOJu0Yz1mIrw6KICX1yTHranGdRwXdwTiXDk1JNA1csQudzXWDnuWxEh
 DWzIAn66WPpREMn8i99GpYUfsUava4HCBQu8hJBfTvJwzZejjBFQHquiBkLoKQXZ/7FY3P72kvp
 YHYAcMWMB/ngJIdw/ZDJWidD2Iu1OIy/1VNyI0epPZWRt1dYoFXPWya8=
X-Gm-Gg: ASbGncueIAt7aQU6BoIxLITWoOio5cazrgKWEaILxFF0VIyuNwAaKiG4S3zOM183LIx
 mkMAOTgWHv9zDEeSi6WyDzqx3o+6aObcXosWIstVrMBLGIMo5uvIgHUzdUquWe6EEhNaKAXm4Vh
 4+WnSvipXjYFY/pv1kilr1yuYTHaaZ0RaVJuYlhzIZUk0nH9HDXFg7HVsUN8WuAFLUNg7f5hjTh
 h22wEBKGgUevh3zrECk4ystLD0bGwL5y7vuSYIIup5TcK5OSJS+6WTG9vjT/YFt1NAj0OhcxMLZ
 ud2tqZ17X1GNyg==
X-Received: by 2002:a05:6000:184c:b0:3a3:6aa4:bf28 with SMTP id
 ffacd0b85a97d-3a36aa4bfe0mr9747148f8f.10.1747754184273; 
 Tue, 20 May 2025 08:16:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ8V25wibgocO+xB92awbcwRJFOHdwAJ517gol3TbCIFo9DfBQsImXvhVghYptcP9WRzi/bA==
X-Received: by 2002:a05:6000:184c:b0:3a3:6aa4:bf28 with SMTP id
 ffacd0b85a97d-3a36aa4bfe0mr9747116f8f.10.1747754183882; 
 Tue, 20 May 2025 08:16:23 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.46.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a366e08747sm13425215f8f.95.2025.05.20.08.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 08:16:23 -0700 (PDT)
Message-ID: <20486914-1752-4710-b000-52ee04d4106d@redhat.com>
Date: Tue, 20 May 2025 17:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/timer/hpet: Adjust num_timers in hpet_init()
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>
References: <20250520152750.2542612-1-zhao1.liu@intel.com>
 <20250520152750.2542612-3-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250520152750.2542612-3-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FL0dXYysoOIjPoI3IDDomx6HcrIjf3_pKwHX9lkbiVQ_1747754184
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 20 May 2025 15:16:32 -0000

On 5/20/25 17:27, Zhao Liu wrote:
> Currently, HPET adjusts num_timers in hpet_realize(), and doesn't change
> it in any other place. And this field is initialized as a property.

Properties are initialized *after* hpet_init.  For hw/timer/hpet you can 
check s->num_timers and return an error if it's out of bounds, but for 
the Rust version we don't have Error** support yet. :(

Queued 1-4-5 for now.

Paolo

> Therefore, it's possible to move such adjustments to hept_init(), so
> that Rust side can synchronize this change.
> 
> Adjust num_timers in hpet_init().
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/timer/hpet.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 0fd1337a1564..48b1a9289f83 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -682,6 +682,12 @@ static void hpet_init(Object *obj)
>       /* HPET Area */
>       memory_region_init_io(&s->iomem, obj, &hpet_ram_ops, s, "hpet", HPET_LEN);
>       sysbus_init_mmio(sbd, &s->iomem);
> +
> +    if (s->num_timers < HPET_MIN_TIMERS) {
> +        s->num_timers = HPET_MIN_TIMERS;
> +    } else if (s->num_timers > HPET_MAX_TIMERS) {
> +        s->num_timers = HPET_MAX_TIMERS;
> +    }
>   }
>   
>   static void hpet_realize(DeviceState *dev, Error **errp)
> @@ -710,11 +716,6 @@ static void hpet_realize(DeviceState *dev, Error **errp)
>           sysbus_init_irq(sbd, &s->irqs[i]);
>       }
>   
> -    if (s->num_timers < HPET_MIN_TIMERS) {
> -        s->num_timers = HPET_MIN_TIMERS;
> -    } else if (s->num_timers > HPET_MAX_TIMERS) {
> -        s->num_timers = HPET_MAX_TIMERS;
> -    }
>       for (i = 0; i < HPET_MAX_TIMERS; i++) {
>           timer = &s->timer[i];
>           timer->qemu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, hpet_timer, timer);


