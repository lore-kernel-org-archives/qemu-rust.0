Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3773CAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 16:12:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3GTo-00039k-ED; Mon, 29 Sep 2025 12:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3GTi-00038T-1n
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 12:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3GTf-0004n2-As
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 12:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759162305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=klCbdKWv205TueXph5zhcNjHe/0wKnrtkNzFlmAYT+c=;
 b=g+W0F6W9aEa1S5EVGXHfq7VeyyLChZRo5pCGYnpC5bpsLwrnvkuy/atl/s4oA0BVuY5y2F
 VUOMa1I895LvK5KolCdWXCmIk/e/nAY/E916Gw3HgWZqvV5K0JF9wBxgrrI01LxxnViU2p
 nMHAuqwWm/6iupINRPf5Yq0VWigKb3o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-8SoLCTyGOheyyNBdUL7fBg-1; Mon, 29 Sep 2025 12:11:44 -0400
X-MC-Unique: 8SoLCTyGOheyyNBdUL7fBg-1
X-Mimecast-MFC-AGG-ID: 8SoLCTyGOheyyNBdUL7fBg_1759162303
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b3d6645acd3so109801666b.1
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 09:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759162303; x=1759767103;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klCbdKWv205TueXph5zhcNjHe/0wKnrtkNzFlmAYT+c=;
 b=a3C9nHzT3TdlJM9AwsbHrdqaVl5uPlS2LI4m2nMPfMpBfFJrwaJbsP8q1X/Dx2ThqD
 KtlN7gikQQKjLD80XhZ8vC+Vx0xpUcAl9ltD+xGJiGRnrGHopR+yr9KxHP2t/9UZuowj
 rc5qjpawanpKkkH+usFe+QxnGBQEjvjky4Yd8BIXyNIPZUZ9bSJqmlJ9TuiMY6S9uSlG
 83VCdJPsKxWOUR2IZRxf773Z3h9yMjiuzgYlQx314HBoYqQFXV3WBJCmicfFpb725Npk
 xKREFCFe+UfQ1ojBCJu51WWKUDBItmE9fBaGHfPb5SXhQNFBQerEkbx8dEv+Rzy+QUcF
 /LVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9xgJmODenmJh4Z2ivrhNDH3UMnXAc5Id4Sxf5Mldk71MjFymBfyMGbNVf6lMZ2+WxQKbwhXmdiv4=@nongnu.org
X-Gm-Message-State: AOJu0YwGw0/NMlZi7kB2nh3W6PxAIUJi4WjIchGpH3WJcXTi1nSDsdUV
 gg+G9bRahEgh7So5G0XHO9IH+ahHcDJHzqBwY/6qrkPerqB9hn9/+iRijlNwyZDklbFbiwujfS9
 pnvoyxs8V7hW6CDC5JSt4zJypgSwc1j1SNmSknn9pVbXBZhbooMf9F9I=
X-Gm-Gg: ASbGnct7v13TF4Q18pQLqY4r/M4HAycvNS3wXjHXmyUdmwr3X19OwkydLdDtZz+Jg0l
 VaPYPheEqqMCb1+BY6xbBTHabtXLYpWvUBs+SCK0eoONs9q1VjIYp5Y7WRedAuHiFWA3siAdaQe
 5g4AsozkygPdrmjgAlSTqcGdy809KHY7U0EPFcyxifVt0aN6iRihJtN/nTnKKnSEE+pFo/Tkz6L
 DanUwNe6fkPY/UNYDYJWqBUKzX35DyYBcuiDDf8ntxj8jbZPSReEDnGom8cxyCWQ6XnYDxkT1Li
 0fJQdJL3u+8xx0kBkFmu3sXVrs8zF6X2P06M8CndrBFZLx9xuXYzbEQFVVpF1qgG5K16PnRsqzm
 KdNAVZmnRsH1N2URY5Em29w4f8Odrd4/DZuG2+GAKSEGxag==
X-Received: by 2002:a17:907:7e9b:b0:b3b:5fe6:577a with SMTP id
 a640c23a62f3a-b3b5fe659a4mr817162666b.8.1759162302844; 
 Mon, 29 Sep 2025 09:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWKLATIsGwEd2IQPO/MK4Gp9VHRj1JyWwRahwLThgpB2FNtf33pP20yzVUbSpsqTIh0F+D5Q==
X-Received: by 2002:a17:907:7e9b:b0:b3b:5fe6:577a with SMTP id
 a640c23a62f3a-b3b5fe659a4mr817160466b.8.1759162302349; 
 Mon, 29 Sep 2025 09:11:42 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b3c40d9ced1sm404876766b.80.2025.09.29.09.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 09:11:41 -0700 (PDT)
Message-ID: <af2375da-427e-4546-83a2-fc816717ee69@redhat.com>
Date: Mon, 29 Sep 2025 18:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] rust: migration: implement ToMigrationState for Timer
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, manos.pitsidianakis@linaro.org
References: <20250920142958.181910-1-pbonzini@redhat.com>
 <20250920142958.181910-7-pbonzini@redhat.com> <aNqwACkjytK3+QQ4@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aNqwACkjytK3+QQ4@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vCbSQm1-49e_tk46ikAmNfKSzx2KeFY9gs6u6cuocoI_1759162303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 9/29/25 18:12, Zhao Liu wrote:
>> +    fn snapshot_migration_state(&self, target: &mut i64) -> Result<(), InvalidError> {
>> +        // SAFETY: as_ptr() is unsafe to ensure that the caller reasons about
>> +        // the pinning of the data inside the Opaque<>.  Here all we do is
>> +        // access a field.
>> +        *target = unsafe { &*self.as_ptr() }.expire_time;
> 
> C side checks timer_pending(), which ensures when the timer is
> inactive, it always saves u64::MAX.
> 
> But now we save the expire_time directly in Rust. I think this would be
> possible to break the migration from Rust timer to C timer, because at
> C side, timer_get() checks whether expire_time is -1 and we can't ensure
> expire_time won't store -2 (or other unusual negative values).

I think this should work in both cases because timer_pending() checks >= 
0 and negative values are extremely far in the future.  But I'll change 
it to timer_expire_time_ns() for safety and clarity.

Paolo


