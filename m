Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQoO-0000TD-UP
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 11:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tgQoI-0000Qv-9Q
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 11:02:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tgQoE-0007Gy-Og
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 11:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738944146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nYmDv7aMaGjQaZMAV2X7qgjajETu0BznXuUVEYnnqMw=;
 b=DYSqI5g0y/GTfPf8sLkL4VpcV05NlO5LVB+rN4kl9sWwMm5AhMGW1mirejrjfWq+NKj5ks
 rq+JTlxX5mAgzl7KzJQstQb9utrxhS51WuAkTR/KqftA13oXi/I0P3LFJz7gDZM/gwDSTS
 ZmPi+FgBol3FB8QMOPaDCvKYu5kOJF8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-vgJhLGrROmyCgmKJZse_Qw-1; Fri, 07 Feb 2025 11:02:22 -0500
X-MC-Unique: vgJhLGrROmyCgmKJZse_Qw-1
X-Mimecast-MFC-AGG-ID: vgJhLGrROmyCgmKJZse_Qw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dc6aad9f8so644287f8f.1
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 08:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738944141; x=1739548941;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nYmDv7aMaGjQaZMAV2X7qgjajETu0BznXuUVEYnnqMw=;
 b=vVWYSiDIkDRkXwnWXCP2ShfsoCAFemRW0fVZaSHd25iXWeE424xTIy9TKj29T5CMtN
 eZaapE8o7T06hSdkY8f/MROuLZU1/NSmtnTty1i5a0MiFpJLd1bmL7fabESwwGEFTiWq
 APWk13c66DmZw5Tf7uKdGaXkdOebQwiyoAHH61TPLM27lDHYBdERiaRe2VCwG7ixWbwh
 bVIDkN5gMw8NOvLmpgGujx3ZckQkjE2Eu2uo2O67om+gYSfInuAPrLJRq/Lzs1L8U5c6
 8zVm6J9JFjXBlE7Nj3rZEpmynXhzpPxU+rqoLHMvytzNPSONJKccZgWYdtlCi18jwG7z
 fTNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqGVnik9aqjxAVipla9wuIGmeYRE68J+fOmZMqhXJfCb+HV6toPt9YCSXUZCW+MR8PRTAXH0KFDBU=@nongnu.org
X-Gm-Message-State: AOJu0YyMrTYXQLGrBvsW8nFXkqo/EQNE3SsTBrPAx0wsvDXYbzsrHj58
 OPFZFTdGm3Ty+F80c5FVv9IRpbFTDMIvefkbIRZMntTahpOhiPsOxFzAiNes9H/yjLXjB0kBvPH
 H+PyWRvxXffCEsInfJEaNUGzZX2LU97rqdQ7uLphQFxffTSnQGv4=
X-Gm-Gg: ASbGncvb1E/S618XBZGgGAwE9JFWgBYM4CL0YhNoTJ49/gaOvK8OWA1XeySYD2Tgkv7
 VYLpGHnV8xhITJoKV9T3FPSxKxkNJfH7px37i+6ljpzDnzdHwvmeaHb06JMR2fxBoWUQTOsDYMX
 Ao+a7g5TLlEI2thtGjTI01vHaJlVJ3XC1NxTaJ+isTxLXzTTlXinStnNaATeWlYUZqkBa0uxIAf
 IPoTYyvQCOhSpoXqO9Iq/kTnfybPhqQZ9TjaLOKQwX/Y0XiVZxjAdM3M1DqgaFN0yd/eW7Hm3N6
 G2A6WX7wEDiVm8E42YZuT5cg2IfgrUhTxaNS
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-43912d49c3amr65700315e9.15.1738944140048; 
 Fri, 07 Feb 2025 08:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPNKYqpqSev2PKeajI3uh5KtnlpQGvb1jhoV/TfPJa8J4oXLNMORLSS+7dvgrHtgXKIkmfJQ==
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-43912d49c3amr65699565e9.15.1738944139545; 
 Fri, 07 Feb 2025 08:02:19 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9648dsm61317795e9.7.2025.02.07.08.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 08:02:18 -0800 (PST)
Message-ID: <75f73a61-b89b-4c17-b72f-35a027049d5e@redhat.com>
Date: Fri, 7 Feb 2025 17:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] tests/qtest: don't attempt to clock_step while
 waiting for virtio ISR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>, Alistair Francis
 <alistair.francis@wdc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Riku Voipio <riku.voipio@iki.fi>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh
 <imp@bsdimp.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250207153112.3939799-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RUIC929kI2jBl3WO1Jq_ImLEs_Bi4zJKcMELArTZxhE_1738944142
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 16:02:33 -0000

On 07/02/2025 16.30, Alex Bennée wrote:
> This replicates the changes from 92cb8f8bf6 (tests/qtest: remove
> clock_steps from virtio tests) as there are no timers in the virtio
> code. We still busy wait and timeout though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - fix trailing space
> ---
>   tests/qtest/libqos/virtio-pci-modern.c | 6 ++----
>   tests/qtest/libqos/virtio-pci.c        | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)

I wonder whether a usleep(10000) in the loop might help to avoid burning too 
much CPU time in there?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>


