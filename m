Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6CDC87FCF
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:59:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk19g-0001x8-9j; Thu, 07 Aug 2025 09:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk19Z-0001si-Tr
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk19Y-0001Uf-5N
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754575171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w4mC43sdkOYN8DO8xZVfIe3ZNV+4qeNeenNNdIx7M3Q=;
 b=WKcv2z3vVjHgrOt6PvStuccShzOrx3TVNjjAjz/6ynFhiG2llIFKdnvpKqnFkCMnJg8p2T
 yVTm6DgghMQOL5wKFX2JhFS2is+DvprU9SrHtfuSGpe9SwaBVC/l1TRKO2cZbz/WV1UOoJ
 xA6Xt3WfR/TEoNQnCKzWBSTc8MAaDQU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-0vZ4S3R0N7m8sjEkvfZfLg-1; Thu, 07 Aug 2025 09:59:29 -0400
X-MC-Unique: 0vZ4S3R0N7m8sjEkvfZfLg-1
X-Mimecast-MFC-AGG-ID: 0vZ4S3R0N7m8sjEkvfZfLg_1754575169
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b785d52c19so467367f8f.1
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754575169; x=1755179969;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w4mC43sdkOYN8DO8xZVfIe3ZNV+4qeNeenNNdIx7M3Q=;
 b=PrxaqBzdVPr6ZuJCA7fafsR+bl8ClkDAm1oiNoC7kwI3KZFaBUexokJDx4K2yypOvY
 LDGFcJFBmN84M6MkVXJmvhL/2VHHCbIan+9y9ly/asAxZTJWufv0JeKbkMExJGLVT5XV
 zwzB0yiirU+A5do6ePerVy0zb0HecX1n2YLSAwlvJwDFauG848cRDxjiD/+ypCd4Fbvz
 KMgiELscgUaaHiWyTARRGNxeS0dnbkjNgXl74cxg5fSphwtJafPLQoYw7/8EA2tcsyJJ
 mzSm0zRzNCSZ4nIfxRn57sFVosnrcXGjtUMcmSHF96kqJ48YPtCr4dMxs/U9Lm1VYdVu
 W3Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8I6KiSBhSGXw2IlJhksay3LfcK5S10RTlv4WgkUFLMBOPsAJzX56GAF7P4Ukkvwgh9JhV3dqZNSw=@nongnu.org
X-Gm-Message-State: AOJu0YxgsEa+WBBaE7zKm37bCBTKTeOPE9S8NOfapTvCVEJQymJSEe1x
 hr0yDkHKgBgJTx5tjJtF0LcaPLY9BEwgzEDaXqhR6uH9b2vicNzpBvc2zNYM3Im+fWUGeMACAif
 uoZemQMhCDbMDBFLgS/Jtc8chSajE5PpEfqtuPwMQ+gATrIiPPwLGAoQ=
X-Gm-Gg: ASbGncuhpads6PzvlfeH98Kc8O2j5t3sbx6cKMJH/z+Ru2ukM49brWI+20OtQt1KV0y
 J27x2aGkxLlGVQWdJ8F3h2yXTegSVmgu3ilKCZZXSe17kPOUh4eI0J/9tQQtPYi95aouwoOSXJV
 fMZvf1aWpAuQxF/dEiBjjlGZh34bkMt8L4sunDxe8Xw2Txym/0766AeJh509D8QMb2mt2L6Et/8
 gKme26LxjNVNsKRKSu2MmE584u4kl7rqhkOPhx4LKeLl2VZ6CwZxjdDrJXTuaAoOWCdWQhuq93F
 eYPIcLwBUCyFkASqjikcM81/BFobk1pWnl9BgzBKL+IS
X-Received: by 2002:a05:6000:24ca:b0:3b7:97c8:da97 with SMTP id
 ffacd0b85a97d-3b8f4924341mr5103684f8f.43.1754575168570; 
 Thu, 07 Aug 2025 06:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4bYybHt6OpehfRrH8E4W3KmHSZkyO01XruguXVMOhUqdH2pZvclXBad/QDtSQsDWetWsHlA==
X-Received: by 2002:a05:6000:24ca:b0:3b7:97c8:da97 with SMTP id
 ffacd0b85a97d-3b8f4924341mr5103655f8f.43.1754575168145; 
 Thu, 07 Aug 2025 06:59:28 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.253.173])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-459ded356b9sm162899795e9.12.2025.08.07.06.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:59:27 -0700 (PDT)
Message-ID: <d144ae17-afe3-4578-a875-79c1d6a4d723@redhat.com>
Date: Thu, 7 Aug 2025 15:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/26] subprojects/vm-memory: Patch vm-memory for QEMU
 memory backend
To: Zhao Liu <zhao1.liu@intel.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-11-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250807123027.2910950-11-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2MuoYhnoSYKEirOwkzOLS6daLie_laWsvuio2mqeqDY_1754575169
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 8/7/25 14:30, Zhao Liu wrote:
> Add 2 patches to support QEMU memory backend implementation.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   .../packagefiles/vm-memory-0.16-rs/0001.diff  |  81 +++++++++++++
>   .../packagefiles/vm-memory-0.16-rs/0002.diff  | 111 ++++++++++++++++++
>   subprojects/vm-memory-0.16-rs.wrap            |   2 +
>   3 files changed, 194 insertions(+)
>   create mode 100644 subprojects/packagefiles/vm-memory-0.16-rs/0001.diff
>   create mode 100644 subprojects/packagefiles/vm-memory-0.16-rs/0002.diff
> 
> diff --git a/subprojects/packagefiles/vm-memory-0.16-rs/0001.diff b/subprojects/packagefiles/vm-memory-0.16-rs/0001.diff
> new file mode 100644
> index 000000000000..037193108d45
> --- /dev/null
> +++ b/subprojects/packagefiles/vm-memory-0.16-rs/0001.diff
> @@ -0,0 +1,81 @@
> +From 298f8ba019b2fe159fa943e0ae4dfd3c83ee64e0 Mon Sep 17 00:00:00 2001
> +From: Zhao Liu <zhao1.liu@intel.com>
> +Date: Wed, 6 Aug 2025 11:31:11 +0800
> +Subject: [PATCH 1/2] guest_memory: Add a marker tarit to implement
> + Bytes<GuestAddress> for GuestMemory

This was a bit surprising.  Maybe this is something where GuestMemory 
needs some extra flexibility.

> @@ -0,0 +1,111 @@
> +From 2af7ea12a589fde619690e5060c01710cb6f2e0e Mon Sep 17 00:00:00 2001
> +From: Zhao Liu <zhao1.liu@intel.com>
> +Date: Wed, 6 Aug 2025 14:27:14 +0800
> +Subject: [PATCH 2/2] guest_memory: Add is_write argument for
> + GuestMemory::try_access()

This should be fine.  But Hanna is also working on IOMMU so maybe this 
won't be needed!

Paolo


