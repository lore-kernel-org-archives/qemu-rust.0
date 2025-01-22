Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tacI0-0001w1-Qs
	for mharc-qemu-rust@gnu.org; Wed, 22 Jan 2025 10:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tacHx-0001rR-IH
 for qemu-rust@nongnu.org; Wed, 22 Jan 2025 10:05:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tacHv-0001ZG-R9
 for qemu-rust@nongnu.org; Wed, 22 Jan 2025 10:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737558302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hBSer5RHte3DiPfBuHNWLnhAhecs5oss4gYGurWr2Rc=;
 b=PdHu0JdhBVbf8wEHoChR3MwLcaFUZeX4N1GXhSlI3/C5C8pmTgLHeGf4uIO1AfBVjSsXYR
 MAUIoGV43P76Il3sG5kNcUfdE0Ilq0juW6JGsZ0AciO0+LCJhdPQyIwKXosn+IjxFc0RRu
 lNfb//gTB7nqT56XeUEDLxW22yjk8p4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-dgIJ2q3mOL2YF8rpFN-AUg-1; Wed, 22 Jan 2025 10:05:00 -0500
X-MC-Unique: dgIJ2q3mOL2YF8rpFN-AUg-1
X-Mimecast-MFC-AGG-ID: dgIJ2q3mOL2YF8rpFN-AUg
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa68203d288so514366666b.1
 for <qemu-rust@nongnu.org>; Wed, 22 Jan 2025 07:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737558299; x=1738163099;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hBSer5RHte3DiPfBuHNWLnhAhecs5oss4gYGurWr2Rc=;
 b=j/sim30/iBNNUOWRywJTA95JOqeBbRa1na92h59F9oKsF0+Suz+NMOjYzLh3w2LnaZ
 MABHXeYYnE0gl+ai8m5HygPFNMbVnOfOAoQn/cfV59PBcopGdpezDsoaEuZWcM8ElTRq
 U2a/vaq1lWeboaSLUxk14pEpjzyggBzrPvntS7oMFdOwnj1WwtN8TNOzdpEJatkqFrMw
 TPEjaMlbyScqgKdGz41u+p4zNm5+Nn/jmYr+dE7NV/4yM4qgGO1Ap8THEzIv8mw532XG
 L9hiWLXANYlkk/OGiPyVidgiajXoK7LH9RHDk4B17QWL33tnpde8ZS940EIqK6RMyBRU
 56lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2K2DWCtI4nSN1AlUmXmOcU9tFbQNOhvzGJLD2aT4Qio+lBfHXqG2JTTECdqeaO2DG3CJGcYIRZmE=@nongnu.org
X-Gm-Message-State: AOJu0YzluWIoo2luCMOgHCmiRHaQqokhS26g4lvvpU4dPyBQE7dfpFc9
 wn5igX+GyrO8B8lkuNBIIRzRtv0qH4BMi49WB6YbGaKUZZpb/29fey8ATZWRb8hRwFnkTs4ZrDc
 3SG/4Dm9V0jrp3XW3KTToqsPIM3vzNNYcpac1Bg7oOR4UWg6TTcI=
X-Gm-Gg: ASbGncuU/9YxH5zMdJvLqT2RxGRwm0UP4b+noJhmSdOskpG6ACQlabzx40XooPNdwRf
 bvcBwylOPcodLDkwXtSNoKNyBhVh3SJaRl6tCBDkgvBFrkLeVGhppOa2+OWJKgeZVouhPU6nxvV
 AljcYzx6sdpqEHP2WCkLQHMT7MRwDARcb5UdWoOnAlof0zH8QAaeQ3kyBkL88QPuiouTKxoospl
 Ny0IC2gCXJjqOZnD+jNTeN2WTDTMRnzqbOI7Oilp6vsNcaiCBHRWGpRj/sJxjaMbf0f8lMpAPw=
X-Received: by 2002:a17:907:930b:b0:aa6:a9fe:46e5 with SMTP id
 a640c23a62f3a-ab38b3dae38mr2251359966b.53.1737558299620; 
 Wed, 22 Jan 2025 07:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFfMJeYJxCZardkse5PMD2GWir/3u16u3koAtpOEvxHnjU7PSyLVQ/mrUWEw52kIdaHVuuRA==
X-Received: by 2002:a17:907:930b:b0:aa6:a9fe:46e5 with SMTP id
 a640c23a62f3a-ab38b3dae38mr2251351866b.53.1737558298951; 
 Wed, 22 Jan 2025 07:04:58 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ab384d2d3dcsm912532166b.81.2025.01.22.07.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 07:04:57 -0800 (PST)
Message-ID: <5ace2ad3-3633-4c79-81c1-aac9d10a16ca@redhat.com>
Date: Wed, 22 Jan 2025 16:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] rust: pl011: extract CharBackend receive logic into
 a separate function
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250117092657.1051233-1-pbonzini@redhat.com>
 <20250117092657.1051233-5-pbonzini@redhat.com> <Z5EHu/7nEbS51IlH@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z5EHu/7nEbS51IlH@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gevSLPurQ-_Iz6m-8GU9XjzDIWrN4OTEUxBbAu4YSFM_1737558300
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 22 Jan 2025 15:05:07 -0000

On 1/22/25 15:59, Zhao Liu wrote:
>>           if size > 0 {
>>               debug_assert!(!buf.is_null());
>> -            state.as_mut().put_fifo(c_uint::from(buf.read_volatile()))
> 
> An extra question...here I'm not sure, do we really need read_volatile?

No, the buffer is not guest visible.  It will certainly go away together 
with chardev bindings.

Paolo


