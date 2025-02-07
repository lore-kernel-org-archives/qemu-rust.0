Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQrE-00034E-Qr
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 11:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tgQqn-0002ry-AI
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 11:05:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tgQqh-0001l9-OE
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 11:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738944298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xz0hJOJEOEWUqaSdSnNyXz9h0M8g/hqw16cg12waP0g=;
 b=hdLuyQhkXSNFoejLuutzMAzGNxYtak0L6h0O7i8S+iaE8GPllN1kp4/8+wihg2/CKP6vHo
 sJQbuBihgrRlONfV7CsrL0kudOwY2Cx45jU5jb4kWQsc28Fxodey11ZYdE7wDWsWGcTxiU
 IEjW3xzCEUStrmSFqzu82Hc7ugrWDUg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-C1xLmZpyO_-ptgjCtkt0HQ-1; Fri, 07 Feb 2025 11:04:57 -0500
X-MC-Unique: C1xLmZpyO_-ptgjCtkt0HQ-1
X-Mimecast-MFC-AGG-ID: C1xLmZpyO_-ptgjCtkt0HQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-436723bf7ffso19150195e9.3
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 08:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738944296; x=1739549096;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xz0hJOJEOEWUqaSdSnNyXz9h0M8g/hqw16cg12waP0g=;
 b=Pi4V6yb5vWIi6uXsnRX9u6THO3DL8YxVDUzpokLiO3EQsh5BfZlSa3N06G69sqq2vX
 plFA172EijFbI7S07CfeWrQZFABftcQPMA4Ix8p+f/3+OcjKsFPMmaD/Li04lIY62X7X
 /DEPjPGmJPSYDZPe2bjTRnPNooCGy/9JCNYB4lXBkAB5g1bohG3RrI5HxC/6tplUYRCh
 Uqwt9kgT1QUhjNDWHJ9sU4uGs/2s43p5tcqVsiplU6BL3XvxCxWA+DrPQPatUEzMjipR
 MqvZFNB7m4UPrevepLWBWE2svpC8E6mIQnDsndY7Jd76IhaQk50UDTmAAI2fYNOfpwcI
 enVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV52wKyfawb7NNgZnlyTiAosyTHoqHz4yY7Z3Y7SIhiTOWrC7AfTd4BP+zMfT50G91ez8JJIctcVuE=@nongnu.org
X-Gm-Message-State: AOJu0Ywl6HZRTCnXwlRmsiwDitZ9/HQGY88YA+7bQnxJ2/hw9KkbTymy
 cF7gernQ07doHliEMr3Ku4iXKCO0dyNnxeS47UsG9oyDhzl/jdjESNfDPJ4nU/sD3NGfBmphus9
 /x6dBzc7SP6vKWO3sgiinizfmFjiQv9IwnzHQDYeHcOckro9ORCM=
X-Gm-Gg: ASbGncs0zbTSbN2HsZFIyiDQrOlMKe9CISqB8x6PG8AN3nKppZ4571dzNS6PJJijttr
 Qqdf1W2qhlYmqokcIL1c3awXqRM2UHMb9/HK8A0EYogkQ/lYYdEW/PD2aLn7HMmuVPrX3TmHmId
 aSozR2GkkazSckWfNsMP6bGw6tQYzNMnXgB1/m6jRfHAS4iTXf87i0hXIL8MPf63+avBnM30CZE
 HAKoZmVsoFlL1uCcSWW0sPWYbTDX35wRF4Zs/OUymxez/KNMFKg3QH07BbQiiQkBEJVexahcKKx
 lnE2wlbACy0l7Fhi82oNytS8XdQ3VImjlMFC
X-Received: by 2002:a05:600c:4754:b0:438:a1f5:3e41 with SMTP id
 5b1f17b1804b1-4392498b6b7mr41958325e9.12.1738944295965; 
 Fri, 07 Feb 2025 08:04:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEraYK+6gmFQGOGrzpx1iIDrUFHB5ABRtYi1f1eu0Eh4M+CzbNxh9pWSyrhWjDG0bCGIZ6Beg==
X-Received: by 2002:a05:600c:4754:b0:438:a1f5:3e41 with SMTP id
 5b1f17b1804b1-4392498b6b7mr41957485e9.12.1738944295545; 
 Fri, 07 Feb 2025 08:04:55 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfc8a4asm59953685e9.32.2025.02.07.08.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 08:04:54 -0800 (PST)
Message-ID: <f9877082-0238-47ec-972b-c750aef356ea@redhat.com>
Date: Fri, 7 Feb 2025 17:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] tests/qtest: rename qtest_send_prefix and
 roll-up into qtest_send
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
 <20250207153112.3939799-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250207153112.3939799-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y6kM0C861gB0ZnVSZdfpfRnZis6HoSTshhJweH-rJD4_1738944296
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
X-List-Received-Date: Fri, 07 Feb 2025 16:05:19 -0000

On 07/02/2025 16.31, Alex Bennée wrote:
> qtest_send_prefix never actually sent something over the chardev, all
> it does is print the timestamp to the QTEST_LOG when enabled. So
> rename the function, make it static, remove the unused CharDev and
> simplify all the call sites by handling that directly with
> qtest_send (and qtest_log_send).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/system/qtest.h |  1 -
>   hw/ppc/spapr_rtas.c    |  1 -
>   hw/riscv/riscv_hart.c  |  1 -
>   system/qtest.c         | 26 +++-----------------------
>   4 files changed, 3 insertions(+), 26 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


