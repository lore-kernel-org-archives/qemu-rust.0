Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB91C87FCA
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk0VN-0003B9-Sa; Thu, 07 Aug 2025 09:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk0VM-0003Ad-BR
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk0VK-0002WF-Ix
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754572677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=D/Id2zcnnR0fHRy+UH4GD6YxhmpweTZLTRWklDZzmWA=;
 b=GM7CYxXPWT8lr+Y9o8rY43yJOZ+hxvRawpeou5Co4LE54mG3NvHZjhmW0Se3MTuuywGTSB
 H5fxLtS7V3AvGYqKjPS6tLT7b3HINe5YNLb3cRgWGxaPDWQZwVrHgk1QRvdYwhfL3QoEg5
 xudM+QEyEkGvQWNx7sBbxPu70ObjXoE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-3bhaYd6YNMeRd2jeHhVrKQ-1; Thu, 07 Aug 2025 09:17:56 -0400
X-MC-Unique: 3bhaYd6YNMeRd2jeHhVrKQ-1
X-Mimecast-MFC-AGG-ID: 3bhaYd6YNMeRd2jeHhVrKQ_1754572675
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b7825a2ca5so999665f8f.1
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754572675; x=1755177475;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D/Id2zcnnR0fHRy+UH4GD6YxhmpweTZLTRWklDZzmWA=;
 b=cD6DcNXfH2sjMKFM4Rg9X+e9xDCHy7YY1R+OJb5TPeDWmNUts0QxmzPzR9jsgHpDrw
 yqajWj5ZQY6cG2tX9P4T68/uj3sopH67OiiKp7T8s5n3SQAH3q152kFN1F0oq0hnuwWk
 TMq3WLGiP1pp4FjF+CXkQ5hxbWnYaHnhjxg+IHKxG/+3516YbyOeG7d7OGHmxpNGUY9f
 6AecaN9iXM9GlfDfO2BuYmHL0iI4x21JutYv2801Mz6f5ilc+90/Rd2DaoJoRpvI2KaI
 xLWyhhMhpYqRFvX2k7JK3EuCaRKVmhtPRfSCyWcU6TC4jcwdMHT14/YIsZmU/XGlSPZU
 zauQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiDu5ms1EwnB6LAmU+2xTAugIbOXiCXXyo0X5tdNugAa5oVNVGdJyfbisv5DX9DYselrR5VYgVZw0=@nongnu.org
X-Gm-Message-State: AOJu0YyCdh4u49EJvlc6jM2sxP2gd/si8OBPorXe1rp/WBRmH3m+63dx
 bHaK1XQaTABLOU5RAEw2TTRprYJmhnATX57xSCJbsL9Q6uPpi3xtJF2B4U4BYJcNddjdSRBjRqb
 A6I0A9zMvWlr4i9FDGQJwDmq2rS8cd156+9UsONaiEi0BTZ9IHMCDCPI=
X-Gm-Gg: ASbGncuuRfbIFLTKSqkum9mb67MQC3Uouv2pkp1u+munyb5fxZ191w+qGPZD75zIyI5
 oL+fjeUdMxMyTO071G8zNq/lOiw74E0Q+8Ry5t7kPs7AWkeGgm71nfBN2kHyfDg2gUt+ditO/GZ
 r5eDRwGsiQ0J50UtQpj5K/gKFzZWTJ0DB0JDCIR6bgP5wWxTONgc79aX+Wh3DsMd+MPQ8i24aoe
 jkCPnWT1d6OYxgz5qEj+d4D6EndH/Ve/vvH51dzc+cq/v8IAdKrj6sMopc6PNKZSAC0lsfdWmCU
 FG/dauT0wtxYGPbuGe8Uxh3nBkwNhFMuPmN07QfHKTas
X-Received: by 2002:a5d:5f82:0:b0:3b7:8f49:94e4 with SMTP id
 ffacd0b85a97d-3b8f97c46efmr2961159f8f.7.1754572675046; 
 Thu, 07 Aug 2025 06:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExHpCdHFDMxBy2yC7Gq3pv6LlUJfp4MOCwML2Xb9f4x2ReZJlNoJgv6o9lI8+7sAd7+m62JA==
X-Received: by 2002:a5d:5f82:0:b0:3b7:8f49:94e4 with SMTP id
 ffacd0b85a97d-3b8f97c46efmr2961132f8f.7.1754572674642; 
 Thu, 07 Aug 2025 06:17:54 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.253.173])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bc12csm27358013f8f.28.2025.08.07.06.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:17:53 -0700 (PDT)
Message-ID: <c7e99d14-eccc-4e97-8b11-1342fe0c5aa6@redhat.com>
Date: Thu, 7 Aug 2025 15:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/26] subprojects: Add winapi crate
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
 <20250807123027.2910950-8-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250807123027.2910950-8-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3_WBIYsQ87kWkHhGKDXs8yIaOoixUZ7Y37hHvc37Y4c_1754572675
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
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

I created https://github.com/rust-vmm/vm-memory/pull/335 so this is not 
needed.

Paolo


