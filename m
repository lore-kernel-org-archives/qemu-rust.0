Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tcKRp-0003LZ-5I
	for mharc-qemu-rust@gnu.org; Mon, 27 Jan 2025 03:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tcKRn-0003L6-QS
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 03:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tcKRm-0004jw-8y
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 03:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737966376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/RvEfmeZRQ4Ncvj9Mnc697q+Da86AInAe6nLMcCJvLo=;
 b=IfKBWQMpAjgbXO83umIqBSYrI4Uv/AGOarne5OzPIGUh0i/lEzlxds7hJQTieYsJyRjRpb
 XFU/M+a+xcEYZECvPT1rYqDvNRJ8L2k41BGWzHRg9OnA1cIFDrJZLChgANtl7faiW7Hrgl
 X8P2tD1kxYXDLio3Jm5eGEZUNDLBw7c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-SL6GcVRPMkKiursmDQ9aYw-1; Mon, 27 Jan 2025 03:26:13 -0500
X-MC-Unique: SL6GcVRPMkKiursmDQ9aYw-1
X-Mimecast-MFC-AGG-ID: SL6GcVRPMkKiursmDQ9aYw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4362f893bfaso22179615e9.1
 for <qemu-rust@nongnu.org>; Mon, 27 Jan 2025 00:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737966372; x=1738571172;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/RvEfmeZRQ4Ncvj9Mnc697q+Da86AInAe6nLMcCJvLo=;
 b=aP+THSSO2brpWheat3p3uckJdjFRxRBjvDEc/fSsGp0h2Jj1X6mbl2boUkCsGw2JHF
 usLGj/KUTnwVahuiG/h9jq9Ovl04tCK09RFNXpIXb34+oc9Z0dHlZ8xgU19b1vFJ4fy7
 XxTkQ+RbP2dveuQI6I2/H9FOKKEVRRBBOzidMJfe5D3AaOWyf8JA9dii9GDZIGSUr6GH
 1GCiTEKv8jGdr1ntNPteQ37QWrTVnrysi+/m0q4p4ZtTO6Ae9Xx7CbGQVFBM9SlXq4T0
 +uiawN8sOsfIipHa/Y99C5Q69SkU2iJlbU/6kKRCB7LoMggsH2wOxCyt7Ln1JRvKXMEh
 YuFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiZ9A6Uv1UcxxIsHF395GPEnia1Xa71YKGVyPYEczRBwoHqaYXyjkKp+1kxfyHIbHYrehwYrvP5M4=@nongnu.org
X-Gm-Message-State: AOJu0YwhFQQh4CmXfpyyqlP9Gmk/1Goc+RPM2a11n21tIyrrdvXVPID5
 gSlbNBXb7IpSRhiSLCuepW+6VA2Zr405TjZhyoVNEvar6ww4w1uWerjBCZSbocEiLY2561gcMsE
 ZdrHteSk1Ey2FHd+sroqcnAsURm6zmsyFooxZO8jz/MsqEXs8KlE=
X-Gm-Gg: ASbGncvfxpUz5ESXz8dTaDeEC2EmQ+2EDRtEMl0pTMn+EE7OSkQmiKeP8FIK1IhoZ+K
 oJi0p+mF0EuC130GJtTkcEgzEJs9y6IjX14kpQHR6p9lg9EtvQXbCdHKS/WpsQ/9XXc4CgUV4po
 ISDjbCmiKYvGRsvyaK/2R0U331+68rbVegvkDrABpkXf5fBslY7BBU6HGPqt7/9eKe9q/e3/7oq
 4ky9coLAOhTK9lO9pTMV+nAS469k7lLodCkl/KH9wS+kwo8LriqUYXzC0uwe9PqwzeHoF0VBtdA
 ONC5rNV4
X-Received: by 2002:a05:600c:3c94:b0:435:192:63ca with SMTP id
 5b1f17b1804b1-43891439f04mr296605525e9.21.1737966372287; 
 Mon, 27 Jan 2025 00:26:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFykkJ8ZcfS2MI1qPDqJarOHleK+dEj5vXa52TfAKDgdzUs+KO3hItuQT+b2ji6JvWXs4RC7g==
X-Received: by 2002:a05:600c:3c94:b0:435:192:63ca with SMTP id
 5b1f17b1804b1-43891439f04mr296605355e9.21.1737966371953; 
 Mon, 27 Jan 2025 00:26:11 -0800 (PST)
Received: from [192.168.10.27] ([151.95.59.125])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9990sm126224955e9.29.2025.01.27.00.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 00:26:11 -0800 (PST)
Message-ID: <67ff25e7-78ff-41b6-9ee4-3de73b83578a@redhat.com>
Date: Mon, 27 Jan 2025 09:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qom: Introduce class_post_init() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-rust@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20250125165855.32168-1-philmd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250125165855.32168-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LkOnQoc2j5IAcyqdeRxxvrDatWdoeXvt3hAgC6fidoQ_1737966372
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jan 2025 08:26:20 -0000

On 1/25/25 17:58, Philippe Mathieu-Daudé wrote:
> Add a class_post_init() handler to be called by parents
> *after* child class_init() handler is called. This is
> necessary to have parent class check children properly
> set some values or mandatory handlers.
> 
> Philippe Mathieu-Daudé (2):
>    qom: Declare class_base_init() before class_init()
>    qom: Introduce class_post_init() handler
> 
>   include/qom/object.h     | 17 ++++++++++-------
>   qom/object.c             | 14 ++++++++++++--
>   rust/qemu-api/src/qom.rs |  8 +++++++-
>   3 files changed, 29 insertions(+), 10 deletions(-)

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


