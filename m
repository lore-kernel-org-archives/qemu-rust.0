Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762FED3C927
	for <qemu-rust@archiver.kernel.org>; Wed, 10 Dec 2025 16:01:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vTMcz-0003ck-KK; Wed, 10 Dec 2025 11:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTMcx-0003c7-M2
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 11:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTMcv-0002m5-EP
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 11:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765382476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cqdqaAZgFpMVSuewAf7oIM+mBfWDXcEpj1XVYRA2zl0=;
 b=Y2BkSe9mE7iuIFhzTf6cf7fadYjczdQuNG9MPOji46lsBYRVB8UWbfIaficw3L5K4p7pNl
 u7ssGDMrqlFl1gwsslVBea670zsIKaL/ceRdxJE+SVUE3NwMEo6IQ8Hj1ZGuuByaNrV+wL
 g7hQatlDAgIPTpl5WKo6aZZTKiyb1fY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-yczgHXOCMw-7CCI_9nsPww-1; Wed, 10 Dec 2025 11:01:14 -0500
X-MC-Unique: yczgHXOCMw-7CCI_9nsPww-1
X-Mimecast-MFC-AGG-ID: yczgHXOCMw-7CCI_9nsPww_1765382473
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42e1e1ca008so580438f8f.0
 for <qemu-rust@nongnu.org>; Wed, 10 Dec 2025 08:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765382473; x=1765987273;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqdqaAZgFpMVSuewAf7oIM+mBfWDXcEpj1XVYRA2zl0=;
 b=JVu7aj+Q065EP0mpUi1WtUGxFsfpD041vPy/xxlnPi0N6bACXLyC8TzMiBQ2F0mssn
 K7BY4jq0ZVpZxvtBGmhFGO9YBvn+stT04+vR+QARwrTjy3wbMuD/qE6CCM3FEo4rmQC/
 dxcpMsWL4VAFkFfUAmmgr1HIO64XDPylFTZ5Bkph8+U1UzCeChDQDJiIPYkRkYIqDAZ6
 oLktqti1uGLlflxkmTOcem6byHe927qrwajX8WiPf3Zv3KBXkWHYMRgfyKYyi89BQ65K
 IpZZWBp5TLnpE+0eyDOZV94VhQIJGAbC+eSA2c1AQINFZb9+vAz8iVVY6qb0K3OIUai2
 Kp1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgbBqLlNlpyycHY1V+9j8tf/SBYX7mr8qSW9s/7HBl/y2r/y6mKsl1XAJFvUuGetwB96nnMQ6uRQo=@nongnu.org
X-Gm-Message-State: AOJu0Yw7vibpeGorlIehPXe6yLH55/Nf7JnXMEL5z88+TwIcZp/K6c6w
 9YfW+8h/I/y6RKNrP7GocXTFE9Cwrf/7BxN5xSiZLgcVFcKeQ1dBBIlSmZaI9lNTKlGmPI9rZuv
 gu/5e9D7veqYFSXzbesdm3oazHeJIk/dOrELEReUwvCCQL426gS8OWN0=
X-Gm-Gg: AY/fxX60zDUu+Q8ZZYOe7Mq+K6Rv612o6PJ9SV/vNTbLltdgyHYsmN8LrY4yhqPHx2V
 n273TfsbXqPdy8UsGUUFgZ/l9Z/0DeY4vw3XIl6qV3+b0lnrpwJETaAmqMWABdliJMi9JixqNXo
 CvaUpaVdoc8joHJOEASxN6doXrabsIuJYCfqB/iH/xqSEks9RNxPpCnz4cU3IIBcPw95zzaSWoJ
 jMWuqZJjbQvB7Jd3WILOiGEqDN//nywhETKf2lq1optJrqs99FDcADc6qzqYbpiKIUb6tf+1/tM
 6rLSI2IM1uW0oL93F2b37py+YgRmiJo7UbEesnKDpv2VGc/FIOMffXV2tIiluQA9x+VBUVlIigq
 mGhY+Qi+RxyS1hoHB98C78w6jTnuZ2bHytfJco4oPKUgDt+otk+iDbPOUw3Y7ReOHAZZAM7nuqT
 +aQJORiWqMbpQ39C4=
X-Received: by 2002:a05:6000:26d2:b0:429:cc39:99c0 with SMTP id
 ffacd0b85a97d-42fa39abcd0mr2612447f8f.1.1765382471500; 
 Wed, 10 Dec 2025 08:01:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7l4BVq+Pj3kSx7GCOjpwG1cPT2A5G8AtsAyZPXAW3dK6Es9deSz7WdPAmeaL38jqzpCu5zQ==
X-Received: by 2002:a05:6000:26d2:b0:429:cc39:99c0 with SMTP id
 ffacd0b85a97d-42fa39abcd0mr2612396f8f.1.1765382470848; 
 Wed, 10 Dec 2025 08:01:10 -0800 (PST)
Received: from [192.168.10.81] ([151.95.145.106])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222484sm38981211f8f.24.2025.12.10.08.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 08:01:10 -0800 (PST)
Message-ID: <1aef2d39-0052-4787-9635-89857bfb4a19@redhat.com>
Date: Wed, 10 Dec 2025 17:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] rust: QObject and QAPI bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, qemu-rust@nongnu.org
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <87tsy52ftl.fsf@pond.sub.org> <87zf7s5h3k.fsf@pond.sub.org>
 <525d2198-5d6f-43a0-88cd-78eae0042d27@redhat.com>
 <878qfa8k82.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <878qfa8k82.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E6NFEXnLNhQ5AAk7NiKtkwfOafks2jtOiLrGLYKdwvU_1765382473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 12/10/25 15:50, Markus Armbruster wrote:
>> Let us know what you'd prefer and we'll switch.  Alternatively,
>> retconning -B's meaning so that it applies to Rust will work too. :)
> 
> Any particular reason *not* to generate Rust unconditionally along with
> C?

Two reasons I can think of:

1) the exact layout is still in flux (not modular, no commands or events).

2) Rust prefers to have all files under a common path ("mod xyz" directs 
the compiler to look at xyz.rs or xyz/mod.rs), which doesn't work well 
if they are created in qapi/meson.build.  There's plenty of workarounds, 
but I'd rather not pick one until the layout is fixed.

So maybe for now we can use -B and not pollute qapi/meson.build, and 
when the generator is more complete we can move Rust generation there?

Paolo


