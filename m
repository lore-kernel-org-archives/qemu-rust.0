Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfyyU-00042A-Rw
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 05:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfyyS-00041r-9S
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 05:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfyyQ-0004dz-OH
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 05:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738837144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EvIy7FgNrSPYU1qD6ZTWsXzYXJW8azLBlhrmG1APOGQ=;
 b=Tcj5+oBcZjod49IYzrM27tRpynA4O9wvSk0IdCwCoCgihL7yHo5v1ssN3zLB/xZNV8UeG/
 AnXD4cxQ/VEodYLD9GSaD9M1EdgVLSB6dyx0LedaDET3jg8gtS53x6i0RpwG5U9cf39kzC
 WfGoWd8O+ihoaUzh0ISBV8Jhp8f/T2A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-VJzuWg1YN86SKyOV0vCuZg-1; Thu, 06 Feb 2025 05:19:03 -0500
X-MC-Unique: VJzuWg1YN86SKyOV0vCuZg-1
X-Mimecast-MFC-AGG-ID: VJzuWg1YN86SKyOV0vCuZg
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab76aa0e72bso78898366b.0
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 02:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738837142; x=1739441942;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EvIy7FgNrSPYU1qD6ZTWsXzYXJW8azLBlhrmG1APOGQ=;
 b=abH27rltzpeh5dFSEdPrdBfFAITmuzVzAuQQeemvkVjZHA2gIu6xUNjM+xfcYeYxce
 37VV9diLhtkrEREcW/CUfw/cDZ8Qy3/zeI9TYUnbM2rxkhwo9clsncNp/MCsjjRblYv8
 +t+j6aULCzY0gaX+3YPkxOUSLav7QoAe7sVpvcuy+bAu6X2LnmlkxPOFkqvzP8U2AmCq
 IV52clfT7GH4BAaxuuUbhKAt++KySGUbGj21AB1q9WNisTgpR3FIsQ+7XFEf+Dj+/4cf
 sfVG23BOj07SUUm8FxRXiKKObEF5irSpzAcv2yeGEN7QVO+YomjxBKfjPTj+mIshVe8f
 LFSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpmvjq0UmBxJ3CPeiUXH2ZK4OYkIdMxJ7EBkHskrE3HrSMFp2ytPUCYms5AK5CptVZU9j7iGSYKQ8=@nongnu.org
X-Gm-Message-State: AOJu0YyzccC6oG5945ZjK1Jz3IrMHl59JZeIEciRJAm0WLwh+sZseCu/
 i3lz83ofhwZL7+V4PGgHOqAF6aHCOcdTRV7ppaOMLEjJa+Jx3aJHYo+AdOwTyoWjBM1BKvbs9dq
 7CR0YSDGj4WeoIz/LbCaLri3Hn73VvHXa5LsVRYgjA9da9PzimGZSCg9kErVAKA==
X-Gm-Gg: ASbGncuf9Efm/2vLQN3LLhOM48fP+qBHfdKccTqIH8u3vV7hbxJJ7bHXwhx8A7c/nPd
 v5BCrtFAMSR14kH65y+fKkEu5wBZlhse8gUeWqtFFHCsvOji7x6rR7l5gJwO6I3i0AaPgWdeUb5
 B54oi13mnbpI8OInTmIPUgvG/avBOjLvJBGdRY/yVnWB4yNK6QeSHFUFs0MH9Mq61gsVrB9JJPI
 AeBzdwfYrT6g+nt3bSaZHJGmsbLSQc9QuNJfwEZJsvGJZBaAicKAW/tzeIraKh0S7DinGelxXTZ
 CWyQJQ==
X-Received: by 2002:a05:6402:4604:b0:5d9:ae5:8318 with SMTP id
 4fb4d7f45d1cf-5dcdb762a2cmr16984480a12.20.1738837141677; 
 Thu, 06 Feb 2025 02:19:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrRWF0l2VLCIaXjAx3Spb5Tpcj8pyzbH+PITE0D4FPuJEAe0WEnTSdYY8Anr6unaLAKAszPA==
X-Received: by 2002:a05:6402:4604:b0:5d9:ae5:8318 with SMTP id
 4fb4d7f45d1cf-5dcdb762a2cmr16984443a12.20.1738837141378; 
 Thu, 06 Feb 2025 02:19:01 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ad6fsm620930a12.18.2025.02.06.02.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 02:19:00 -0800 (PST)
Message-ID: <3953673d-873b-4379-9bff-c9bf68130b75@redhat.com>
Date: Thu, 6 Feb 2025 11:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com>
 <7e35b5b6-01dd-457b-b36f-507a85300b45@linaro.org>
 <CABgObfbr4yHBJxCVtOk9rQau3Z8M-QUy0+OqTnjecTsKTXrH0Q@mail.gmail.com>
 <ad5dcd1b-ae0e-42ac-befe-a33b3f900c71@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ad5dcd1b-ae0e-42ac-befe-a33b3f900c71@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rKb_X1QDDzKYo8IKYHuWCGpENZFDkRQaajGhIKco6tk_1738837142
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Thu, 06 Feb 2025 10:19:09 -0000

On 2/6/25 11:02, Philippe Mathieu-Daudé wrote:
>>> Could we always make .valid_sizes() explicit?
>>
>> Yes (for example build() could even fail to compile if you don't have
>> impl_sizes/valid_sizes set), but why do you want that? I'm not even
>> sure that all cases of .valid.max_access_size=4 are correct...
> 
> Exactly for that :) Not have implicit default values, so correct
> values are reviewed when models are added.

But I wouldn't bet that those that we have in C are reviewed and 
correct...  They are incorrect if the hardware accepts 8-byte writes, 
either discarding the top 4 bytes (then impl must both be 8) or writing 
to both registers (then impl must be 4).

Paolo


